from flask import Flask, render_template, redirect, url_for, flash, request
from flask_sqlalchemy import SQLAlchemy
from flask_login import LoginManager, login_user, login_required, logout_user, current_user, UserMixin
from werkzeug.security import generate_password_hash, check_password_hash
from functools import wraps

app = Flask(__name__)
app.config['SECRET_KEY'] = 'supersecretkey'
app.config['SQLALCHEMY_DATABASE_URI'] = 'sqlite:///instance/app.db'
app.config['SQLALCHEMY_DATABASE_URI'] = 'sqlite:///app.db'
app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = False

db = SQLAlchemy(app)
login_manager = LoginManager(app)
login_manager.login_view = 'login'

# ===== Models =====
class User(db.Model, UserMixin):
    id = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.String(150))
    email = db.Column(db.String(150), unique=True)
    password = db.Column(db.String(150))
    role = db.Column(db.String(50), default='student')  # admin or student

    def set_password(self, password):
        self.password = generate_password_hash(password)

    def check_password(self, password):
        return check_password_hash(self.password, password)

    @property
    def is_admin(self):
        return self.role == 'admin'

class Course(db.Model):
    id = db.Column(db.Integer, primary_key=True)
    title = db.Column(db.String(150))
    short_desc = db.Column(db.String(300))
    content = db.Column(db.Text)
    lessons = db.relationship('Lesson', backref='course', cascade="all, delete-orphan")
    quizzes = db.relationship('Quiz', backref='course', cascade="all, delete-orphan")

class Lesson(db.Model):
    id = db.Column(db.Integer, primary_key=True)
    title = db.Column(db.String(150))
    content = db.Column(db.Text)
    course_id = db.Column(db.Integer, db.ForeignKey('course.id'))

class Quiz(db.Model):
    id = db.Column(db.Integer, primary_key=True)
    title = db.Column(db.String(150))
    course_id = db.Column(db.Integer, db.ForeignKey('course.id'))
    questions = db.relationship('Question', backref='quiz', cascade="all, delete-orphan")

class Question(db.Model):
    id = db.Column(db.Integer, primary_key=True)
    text = db.Column(db.String(300))
    correct_answer = db.Column(db.String(150))
    quiz_id = db.Column(db.Integer, db.ForeignKey('quiz.id'))

# ===== Login =====
@login_manager.user_loader
def load_user(user_id):
    return User.query.get(int(user_id))

# ===== Admin Decorator =====
def admin_required(f):
    @wraps(f)
    def decorated_function(*args, **kwargs):
        if not current_user.is_authenticated or not current_user.is_admin:
            flash("Admin access required", "danger")
            return redirect(url_for('login'))
        return f(*args, **kwargs)
    return decorated_function

# ===== Routes =====
@app.route('/')
def index():
    courses = Course.query.all()
    return render_template('index.html', courses=courses)

@app.route('/register', methods=['GET', 'POST'])
def register():
    if request.method == 'POST':
        name = request.form.get('name')
        email = request.form.get('email')
        password = request.form.get('password')
        if not name or not email or not password:
            flash("Please fill all fields", "warning")
            return redirect(url_for('register'))
        if User.query.filter_by(email=email).first():
            flash("Email already registered", "danger")
            return redirect(url_for('register'))
        user = User(name=name, email=email)
        user.set_password(password)
        db.session.add(user)
        db.session.commit()
        flash("Account created! Please login.", "success")
        return redirect(url_for('login'))
    return render_template('register.html')

@app.route('/login', methods=['GET', 'POST'])
def login():
    if request.method == 'POST':
        email = request.form.get('email')
        password = request.form.get('password')
        if not email or not password:
            flash("Please fill in all fields", "warning")
            return redirect(url_for('login'))
        user = User.query.filter_by(email=email).first()
        if user and user.check_password(password):
            login_user(user)
            flash("Logged in successfully!", "success")
            return redirect(url_for('dashboard'))
        else:
            flash("Invalid credentials", "danger")
            return redirect(url_for('login'))
    return render_template('login.html')

@app.route('/logout')
@login_required
def logout():
    logout_user()
    flash("Logged out", "info")
    return redirect(url_for('index'))

@app.route('/dashboard')
@login_required
def dashboard():
    courses = Course.query.all()
    return render_template('dashboard.html', courses=courses)

@app.route('/courses')
def courses():
    courses = Course.query.all()  # or []
    return render_template('courses.html', courses=courses)


@app.route('/course/<int:course_id>')
@login_required
def course_detail(course_id):
    course = Course.query.get_or_404(course_id)
    return render_template('course_detail.html', course=course)

@app.route('/lesson/<int:lesson_id>')
@login_required
def lesson_page(lesson_id):
    lesson = Lesson.query.get_or_404(lesson_id)
    return render_template('lesson.html', lesson=lesson)

@app.route('/quiz/<int:quiz_id>', methods=['GET', 'POST'])
@login_required
def quiz_page(quiz_id):
    quiz = Quiz.query.get_or_404(quiz_id)
    if request.method == 'POST':
        score = 0
        for q in quiz.questions:
            ans = request.form.get(f'q-{q.id}', '')
            if ans.strip().lower() == q.correct_answer.lower():
                score += 1
        flash(f"You scored {score}/{len(quiz.questions)}", "info")
        return redirect(url_for('dashboard'))
    return render_template('quiz.html', quiz=quiz)

# ===== Admin Routes =====
@app.route('/admin/course/<int:course_id>/edit', methods=['GET', 'POST'])
@login_required
@admin_required
def edit_course(course_id):
    course = Course.query.get_or_404(course_id)
    if request.method == 'POST':
        course.title = request.form.get('title')
        course.short_desc = request.form.get('short_desc')
        course.content = request.form.get('content')
        db.session.commit()
        flash("Course updated successfully!", "success")
        return redirect(url_for('courses'))
    return render_template('admin/edit_course.html', course=course)

@app.route('/admin/course/<int:course_id>/delete')
@login_required
@admin_required
def delete_course(course_id):
    course = Course.query.get_or_404(course_id)
    db.session.delete(course)
    db.session.commit()
    flash("Course deleted successfully!", "danger")
    return redirect(url_for('courses'))

@app.route('/admin/course/<int:course_id>/lessons/add', methods=['GET', 'POST'])
@login_required
@admin_required
def add_lesson(course_id):
    course = Course.query.get_or_404(course_id)
    if request.method == 'POST':
        title = request.form.get('title')
        content = request.form.get('content')
        lesson = Lesson(title=title, content=content, course_id=course.id)
        db.session.add(lesson)
        db.session.commit()
        flash("Lesson added successfully!", "success")
        return redirect(url_for('course_detail', course_id=course.id))
    return render_template('admin/add_lesson.html', course=course)

@app.route('/admin/course/<int:course_id>/quiz')
@login_required
@admin_required
def manage_quiz(course_id):
    course = Course.query.get_or_404(course_id)
    quizzes = Quiz.query.filter_by(course_id=course.id).all()
    return render_template('admin/manage_quiz.html', course=course, quizzes=quizzes)

# ===== Create DB and default admin =====
def init_db():
    db.create_all()
    if not User.query.filter_by(email="admin@example.com").first():
        admin = User(name="Admin", email="admin@example.com", role="admin")
        admin.set_password("admin123")
        db.session.add(admin)
        db.session.commit()
        print("Default admin created: admin@example.com / admin123")

if __name__ == '__main__':
    with app.app_context():
        init_db()
    app.run(debug=True)
