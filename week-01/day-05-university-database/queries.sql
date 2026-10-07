-- =============================================
-- University Database Project
-- Business Queries
-- =============================================



-- =============================================
-- LEVEL 1
-- Basic JOIN Queries
-- =============================================


-- Query 01
-- List all students with their departments.

SELECT
    s.name,
    s.surname,
    d.department_name
FROM students s
JOIN departments d
    ON s.department_id = d.department_id;


-- Query 02
-- List Computer Engineering students.

SELECT
    s.name,
    s.surname
FROM students s
JOIN departments d
    ON s.department_id = d.department_id
WHERE d.department_name = 'Computer Engineering';


-- Query 03
-- Count students in each department.

SELECT
    d.department_name,
    COUNT(*) AS student_count
FROM departments d
JOIN students s
    ON s.department_id = d.department_id
GROUP BY d.department_id, d.department_name
ORDER BY student_count DESC;


-- Query 04
-- List courses with their departments.

SELECT
    c.course_code,
    c.course_name,
    d.department_name
FROM courses c
JOIN departments d
    ON c.department_id = d.department_id;


-- Query 05
-- List courses belonging to the Engineering Faculty.

SELECT
    c.course_code,
    c.course_name,
    d.department_name
FROM courses c
JOIN departments d
    ON c.department_id = d.department_id
WHERE d.faculty = 'Engineering Faculty';



-- =============================================
-- LEVEL 2
-- Students, Courses and Enrollments
-- =============================================


-- Query 06
-- List every student and the courses they are enrolled in.

SELECT
    s.name,
    s.surname,
    c.course_code,
    c.course_name
FROM students s
JOIN enrollments e
    ON s.student_id = e.student_id
JOIN courses c
    ON e.course_id = c.course_id;


-- Query 07
-- List Tarik's courses and grades.

SELECT
    s.name,
    s.surname,
    c.course_code,
    c.course_name,
    e.grade
FROM students s
JOIN enrollments e
    ON s.student_id = e.student_id
JOIN courses c
    ON e.course_id = c.course_id
WHERE s.student_id = 2;


-- Query 08
-- List students taking Database Systems.

SELECT
    s.name,
    s.surname,
    e.grade
FROM students s
JOIN enrollments e
    ON s.student_id = e.student_id
JOIN courses c
    ON e.course_id = c.course_id
WHERE c.course_name = 'Database Systems';


-- Query 09
-- Count how many courses each student takes.

SELECT
    s.name,
    s.surname,
    COUNT(*) AS course_count
FROM students s
JOIN enrollments e
    ON s.student_id = e.student_id
GROUP BY s.student_id, s.name, s.surname
ORDER BY course_count DESC;


-- Query 10
-- Count students enrolled in each course.

SELECT
    c.course_code,
    c.course_name,
    COUNT(*) AS student_count
FROM courses c
JOIN enrollments e
    ON c.course_id = e.course_id
GROUP BY c.course_id, c.course_code, c.course_name
ORDER BY student_count DESC;



-- =============================================
-- LEVEL 3
-- Grade Analysis
-- =============================================


-- Query 11
-- Calculate the average grade for each student.

SELECT
    s.name,
    s.surname,
    AVG(e.grade) AS average_grade
FROM students s
JOIN enrollments e
    ON s.student_id = e.student_id
GROUP BY s.student_id, s.name, s.surname
ORDER BY average_grade DESC;


-- Query 12
-- Calculate the average grade for each course.

SELECT
    c.course_code,
    c.course_name,
    AVG(e.grade) AS average_grade
FROM courses c
JOIN enrollments e
    ON c.course_id = e.course_id
GROUP BY c.course_id, c.course_code, c.course_name
ORDER BY average_grade DESC;


-- Query 13
-- Find the highest grade for each student.

SELECT
    s.name,
    s.surname,
    MAX(e.grade) AS highest_grade
FROM students s
JOIN enrollments e
    ON s.student_id = e.student_id
GROUP BY s.student_id, s.name, s.surname
ORDER BY highest_grade DESC;


-- Query 14
-- Find the highest grade for each course.

SELECT
    c.course_code,
    c.course_name,
    MAX(e.grade) AS highest_grade
FROM courses c
JOIN enrollments e
    ON c.course_id = e.course_id
GROUP BY c.course_id, c.course_code, c.course_name
ORDER BY highest_grade DESC;


-- Query 15
-- Find students whose average grade is above 80.

SELECT
    s.name,
    s.surname,
    AVG(e.grade) AS average_grade
FROM students s
JOIN enrollments e
    ON s.student_id = e.student_id
GROUP BY s.student_id, s.name, s.surname
HAVING AVG(e.grade) > 80
ORDER BY average_grade DESC;



-- =============================================
-- WEEK 1 FINAL CHALLENGE
-- =============================================


-- Query 16
-- Find students with an average grade of at least 85.

SELECT
    s.name,
    s.surname,
    AVG(e.grade) AS average_grade
FROM students s
JOIN enrollments e
    ON s.student_id = e.student_id
GROUP BY s.student_id, s.name, s.surname
HAVING AVG(e.grade) >= 85
ORDER BY average_grade DESC;


-- Query 17
-- Count courses in each department.

SELECT
    d.department_name,
    COUNT(*) AS course_count
FROM departments d
JOIN courses c
    ON c.department_id = d.department_id
GROUP BY d.department_id, d.department_name
ORDER BY course_count DESC;


-- Query 18
-- List courses taken by Computer Engineering students.

SELECT
    s.name,
    s.surname,
    c.course_code,
    c.course_name,
    e.grade
FROM students s
JOIN departments d
    ON s.department_id = d.department_id
JOIN enrollments e
    ON s.student_id = e.student_id
JOIN courses c
    ON e.course_id = c.course_id
WHERE d.department_name = 'Computer Engineering';


-- Query 19
-- Show the highest and lowest grade for every student.

SELECT
    s.name,
    s.surname,
    MAX(e.grade) AS highest_grade,
    MIN(e.grade) AS lowest_grade
FROM students s
JOIN enrollments e
    ON s.student_id = e.student_id
GROUP BY s.student_id, s.name, s.surname;


-- Query 20
-- Find courses with an average grade above 80.

SELECT
    c.course_name,
    AVG(e.grade) AS average_grade
FROM courses c
JOIN enrollments e
    ON c.course_id = e.course_id
GROUP BY c.course_id, c.course_name
HAVING AVG(e.grade) > 80
ORDER BY average_grade DESC;


-- Query 21
-- Find courses with at least two enrolled students.

SELECT
    c.course_code,
    c.course_name,
    COUNT(*) AS student_count
FROM courses c
JOIN enrollments e
    ON c.course_id = e.course_id
GROUP BY c.course_id, c.course_code, c.course_name
HAVING COUNT(*) >= 2
ORDER BY student_count DESC;


-- Query 22
-- Calculate the average student grade for each department.

SELECT
    d.department_name,
    AVG(e.grade) AS average_grade
FROM departments d
JOIN students s
    ON s.department_id = d.department_id
JOIN enrollments e
    ON s.student_id = e.student_id
GROUP BY d.department_id, d.department_name
ORDER BY average_grade DESC;