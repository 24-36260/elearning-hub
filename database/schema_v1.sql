-- Users table
CREATE TABLE users (
    user_id INTEGER PRIMARY KEY AUTOINCREMENT,
    username TEXT NOT NULL UNIQUE,
    email TEXT NOT NULL UNIQUE,
    password TEXT NOT NULL
);

-- Courses table
CREATE TABLE courses (
    course_id INTEGER PRIMARY KEY AUTOINCREMENT,
    course_name TEXT NOT NULL,
    instructor_id INTEGER,
    FOREIGN KEY (instructor_id) REFERENCES users(user_id)
);

-- Lessons table
CREATE TABLE lessons (
    lesson_id INTEGER PRIMARY KEY AUTOINCREMENT,
    lesson_title TEXT NOT NULL,
    course_id INTEGER NOT NULL,
    FOREIGN KEY (course_id) REFERENCES courses(course_id)
);

-- Quizzes table
CREATE TABLE quizzes (
    quiz_id INTEGER PRIMARY KEY AUTOINCREMENT,
    quiz_title TEXT NOT NULL,
    lesson_id INTEGER NOT NULL,
    FOREIGN KEY (lesson_id) REFERENCES lessons(lesson_id)
);

-- Questions table
CREATE TABLE questions (
    question_id INTEGER PRIMARY KEY AUTOINCREMENT,
    quiz_id INTEGER NOT NULL,
    question_text TEXT NOT NULL,
    answer TEXT NOT NULL,
    FOREIGN KEY (quiz_id) REFERENCES quizzes(quiz_id)
);
