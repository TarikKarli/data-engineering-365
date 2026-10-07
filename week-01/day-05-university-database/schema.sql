-- =============================================
-- University Database Project
-- Database Schema
-- =============================================


-- 1. Departments Table

CREATE TABLE departments (
    department_id INTEGER PRIMARY KEY,
    department_name VARCHAR(100) NOT NULL UNIQUE,
    faculty VARCHAR(100) NOT NULL,
    active BOOLEAN DEFAULT TRUE
);


-- 2. Students Table

CREATE TABLE students (
    student_id INTEGER PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    surname VARCHAR(100) NOT NULL,
    age INTEGER NOT NULL CHECK (age BETWEEN 17 AND 100),
    city VARCHAR(100) NOT NULL,
    department_id INTEGER NOT NULL
        REFERENCES departments(department_id)
);


-- 3. Courses Table

CREATE TABLE courses (
    course_id INTEGER PRIMARY KEY,
    course_code VARCHAR(20) NOT NULL UNIQUE,
    course_name VARCHAR(100) NOT NULL,
    credits INTEGER NOT NULL CHECK (credits BETWEEN 1 AND 10),
    department_id INTEGER NOT NULL
        REFERENCES departments(department_id),
    active BOOLEAN DEFAULT TRUE
);


-- 4. Enrollments Table

CREATE TABLE enrollments (
    enrollment_id INTEGER PRIMARY KEY,
    student_id INTEGER NOT NULL
        REFERENCES students(student_id),
    course_id INTEGER NOT NULL
        REFERENCES courses(course_id),
    enrollment_date DATE NOT NULL DEFAULT CURRENT_DATE,
    grade INTEGER CHECK (grade BETWEEN 0 AND 100),

    UNIQUE (student_id, course_id)
);