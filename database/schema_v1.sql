-- Users table
CREATE TABLE users (
    user_id INT IDENTITY(1,1) PRIMARY KEY,
    full_name NVARCHAR(255) NOT NULL,
    email NVARCHAR(255) NOT NULL UNIQUE,
    password_hash NVARCHAR(255) NOT NULL,
    role NVARCHAR(50) NOT NULL
);

-- Courses table
CREATE TABLE courses (
    course_id INT IDENTITY(1,1) PRIMARY KEY,
    course_title NVARCHAR(255) NOT NULL
);

-- Quizzes table
CREATE TABLE quizzes (
    quiz_id INT IDENTITY(1,1) PRIMARY KEY,
    course_id INT NOT NULL,
    quiz_title NVARCHAR(255) NOT NULL
);

-- Quiz Questions table
CREATE TABLE quiz_questions (
    question_id INT IDENTITY(1,1) PRIMARY KEY,
    quiz_id INT NOT NULL,
    question NVARCHAR(MAX) NOT NULL,
    option_a NVARCHAR(255),
    option_b NVARCHAR(255),
    option_c NVARCHAR(255),
    option_d NVARCHAR(255),
    correct_answer NVARCHAR(1)
);
