-- ============================================================
-- DATA ENGINEERING 365
-- WEEK 2 - DAY 6
-- SQL JOIN PRACTICE
-- ============================================================
--
-- Topics:
-- - INNER JOIN
-- - LEFT JOIN
-- - RIGHT JOIN
-- - FULL OUTER JOIN
-- - Finding unmatched records
-- - Multi-table JOINs
-- - COUNT() with LEFT JOIN
-- - JOIN-based business questions
--
-- ============================================================



-- ============================================================
-- 1. INNER JOIN
-- ============================================================

-- Query 01
-- Show only students who have at least one enrollment.
--
-- INNER JOIN returns only rows that exist in both tables.

SELECT
    s.student_id,
    s.name,
    s.surname,
    e.course_id
FROM students s
INNER JOIN enrollments e
    ON e.student_id = s.student_id;



-- ============================================================
-- 2. LEFT JOIN
-- ============================================================

-- Query 02
-- Show all students and their course IDs.
--
-- Students without any enrollment are still included.
-- Their course_id will be NULL.

SELECT
    s.student_id,
    s.name,
    s.surname,
    e.course_id
FROM students s
LEFT JOIN enrollments e
    ON e.student_id = s.student_id;



-- ============================================================
-- 3. LEFT JOIN + IS NULL
-- Finding unmatched records
-- ============================================================

-- Query 03
-- Find students who are not enrolled in any course.

SELECT
    s.name,
    s.surname
FROM students s
LEFT JOIN enrollments e
    ON e.student_id = s.student_id
WHERE e.student_id IS NULL;


-- Query 04
-- Find courses that have no enrolled students.

SELECT
    c.course_code,
    c.course_name
FROM courses c
LEFT JOIN enrollments e
    ON e.course_id = c.course_id
WHERE e.course_id IS NULL;



-- ============================================================
-- 4. MULTI-TABLE LEFT JOIN
-- ============================================================

-- Query 05
-- Show all courses and the students enrolled in them.
--
-- Courses without students are still included.

SELECT
    c.course_code,
    c.course_name,
    s.name,
    s.surname
FROM courses c
LEFT JOIN enrollments e
    ON e.course_id = c.course_id
LEFT JOIN students s
    ON s.student_id = e.student_id;



-- ============================================================
-- 5. RIGHT JOIN
-- ============================================================

-- Query 06
-- Show all students and their course IDs using RIGHT JOIN.
--
-- RIGHT JOIN keeps every row from the right table.

SELECT
    s.name,
    s.surname,
    e.course_id
FROM enrollments e
RIGHT JOIN students s
    ON s.student_id = e.student_id;


-- This produces a similar result to:
--
-- students
-- LEFT JOIN enrollments
--
-- because students is the table being preserved.



-- ============================================================
-- 6. FULL OUTER JOIN
-- ============================================================

-- Query 07
-- Keep all rows from both students and enrollments.
--
-- FULL OUTER JOIN preserves unmatched rows from both sides.

SELECT
    s.name,
    s.surname,
    e.course_id
FROM students s
FULL OUTER JOIN enrollments e
    ON e.student_id = s.student_id;



-- ============================================================
-- 7. COUNT() WITH LEFT JOIN
-- ============================================================

-- Query 08
-- Show all courses and count how many students are enrolled.
--
-- Important:
-- COUNT(e.student_id) is used instead of COUNT(*).
--
-- COUNT(column) ignores NULL values, therefore courses with
-- no students correctly return 0.

SELECT
    c.course_code,
    c.course_name,
    COUNT(e.student_id) AS student_count
FROM courses c
LEFT JOIN enrollments e
    ON e.course_id = c.course_id
GROUP BY
    c.course_id,
    c.course_code,
    c.course_name
ORDER BY student_count DESC;



-- ============================================================
-- 8. FIND EMPTY COURSES USING GROUP BY + HAVING
-- ============================================================

-- Query 09
-- Find courses with zero enrolled students.
--
-- This is an alternative to LEFT JOIN + IS NULL.

SELECT
    c.course_code,
    c.course_name,
    COUNT(e.student_id) AS student_count
FROM courses c
LEFT JOIN enrollments e
    ON e.course_id = c.course_id
GROUP BY
    c.course_id,
    c.course_code,
    c.course_name
HAVING COUNT(e.student_id) = 0;



-- ============================================================
-- 9. STUDENT COUNT PER DEPARTMENT
-- ============================================================

-- Query 10
-- Show all departments and their number of students.
--
-- Departments without students are still included and return 0.

SELECT
    d.department_name,
    COUNT(s.student_id) AS student_count
FROM departments d
LEFT JOIN students s
    ON s.department_id = d.department_id
GROUP BY
    d.department_id,
    d.department_name;



-- ============================================================
-- 10. COURSE COUNT PER DEPARTMENT
-- ============================================================

-- Query 11
-- Show all departments and their number of courses.
--
-- Departments without courses return 0.

SELECT
    d.department_name,
    COUNT(c.course_id) AS course_count
FROM departments d
LEFT JOIN courses c
    ON c.department_id = d.department_id
GROUP BY
    d.department_id,
    d.department_name;



-- ============================================================
-- 11. COURSE COUNT PER STUDENT
-- ============================================================

-- Query 12
-- Show every student and how many courses they take.
--
-- Students without courses return 0.

SELECT
    s.name,
    s.surname,
    COUNT(e.course_id) AS course_count
FROM students s
LEFT JOIN enrollments e
    ON e.student_id = s.student_id
GROUP BY
    s.student_id,
    s.name,
    s.surname;



-- ============================================================
-- 12. STUDENTS + COURSES + COURSE DEPARTMENT
-- ============================================================

-- Query 13
-- Show each student, the courses they take,
-- and the department that owns each course.
--
-- Students without courses remain in the result.

SELECT
    s.name,
    s.surname,
    c.course_name,
    d.department_name
FROM students s
LEFT JOIN enrollments e
    ON e.student_id = s.student_id
LEFT JOIN courses c
    ON c.course_id = e.course_id
LEFT JOIN departments d
    ON d.department_id = c.department_id;



-- ============================================================
-- 13. ENROLLMENT COUNT PER DEPARTMENT
-- ============================================================

-- Query 14
-- Count total enrollments belonging to courses
-- in each department.
--
-- Departments without enrollments return 0.

SELECT
    d.department_name,
    COUNT(e.enrollment_id) AS enrollment_count
FROM departments d
LEFT JOIN courses c
    ON c.department_id = d.department_id
LEFT JOIN enrollments e
    ON e.course_id = c.course_id
GROUP BY
    d.department_id,
    d.department_name;



-- ============================================================
-- 14. CONDITIONAL AGGREGATION WITH FILTER
-- ============================================================

-- Query 15
-- Count courses without students for each department.
--
-- FILTER allows COUNT() to count only rows
-- that satisfy a specific condition.

SELECT
    d.department_name,
    COUNT(c.course_id) FILTER (
        WHERE e.student_id IS NULL
    ) AS empty_course_count
FROM departments d
LEFT JOIN courses c
    ON c.department_id = d.department_id
LEFT JOIN enrollments e
    ON e.course_id = c.course_id
GROUP BY
    d.department_id,
    d.department_name;



-- ============================================================
-- 15. MINI CHALLENGE
-- ============================================================

-- Challenge 01
-- Show every student and the courses they take.
--
-- Students without courses should still appear.

SELECT
    s.name,
    s.surname,
    c.course_name
FROM students s
LEFT JOIN enrollments e
    ON e.student_id = s.student_id
LEFT JOIN courses c
    ON c.course_id = e.course_id;


-- Challenge 02
-- Find students with no enrollment.

SELECT
    s.name,
    s.surname
FROM students s
LEFT JOIN enrollments e
    ON e.student_id = s.student_id
WHERE e.student_id IS NULL;


-- Challenge 03
-- Show all courses and their students.
--
-- Courses without students should remain visible.

SELECT
    c.course_code,
    c.course_name,
    s.name,
    s.surname
FROM courses c
LEFT JOIN enrollments e
    ON e.course_id = c.course_id
LEFT JOIN students s
    ON s.student_id = e.student_id;


-- Challenge 04
-- Find courses that have no enrolled students.

SELECT
    c.course_code,
    c.course_name
FROM courses c
LEFT JOIN enrollments e
    ON e.course_id = c.course_id
WHERE e.course_id IS NULL;


-- Challenge 05
-- Find students taking a course outside their own department.
--
-- Compare:
-- student's department_id
-- with
-- course's department_id

SELECT
    s.name,
    s.surname,
    c.course_name
FROM students s
JOIN enrollments e
    ON e.student_id = s.student_id
JOIN courses c
    ON c.course_id = e.course_id
WHERE s.department_id <> c.department_id;



-- ============================================================
-- DAY 6 KEY NOTES
-- ============================================================

-- INNER JOIN
-- Returns only matching rows.

-- LEFT JOIN
-- Keeps every row from the left table.

-- RIGHT JOIN
-- Keeps every row from the right table.

-- FULL OUTER JOIN
-- Keeps every row from both tables.

-- LEFT JOIN + IS NULL
-- Useful for finding records without a match.

-- COUNT(*)
-- Counts rows.

-- COUNT(column)
-- Counts non-NULL values only.

-- When using LEFT JOIN to count matching records,
-- COUNT(right_table.id) is usually more appropriate
-- than COUNT(*).

-- Always check the ON condition carefully.
--
-- Example:
--
-- Correct:
-- e.student_id = s.student_id
--
-- Incorrect:
-- e.student_id = e.student_id
--
-- JOIN conditions should represent the real relationship
-- between the tables.