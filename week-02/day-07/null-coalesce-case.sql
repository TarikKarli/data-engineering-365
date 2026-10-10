-- ============================================================
-- DATA ENGINEERING 365
-- WEEK 2 - DAY 7
-- NULL, COALESCE AND CASE WHEN
-- ============================================================


-- ============================================================
-- 1. IS NULL
-- Find enrollments whose grades have not been entered yet.
-- ============================================================

SELECT
    e.enrollment_id,
    e.student_id,
    e.course_id,
    e.grade
FROM enrollments e
WHERE e.grade IS NULL;


-- ============================================================
-- 2. IS NOT NULL
-- Find enrollments whose grades have been entered.
-- ============================================================

SELECT
    e.enrollment_id,
    e.student_id,
    e.course_id,
    e.grade
FROM enrollments e
WHERE e.grade IS NOT NULL;


-- ============================================================
-- 3. COALESCE
-- Display 0 instead of NULL grade.
-- This does not change the actual database value.
-- ============================================================

SELECT
    e.enrollment_id,
    e.student_id,
    e.course_id,
    COALESCE(e.grade, 0) AS display_grade
FROM enrollments e;


-- ============================================================
-- 4. COALESCE WITH TEXT
-- Display "Pending" when grade is NULL.
-- ============================================================

SELECT
    e.enrollment_id,
    COALESCE(e.grade::text, 'Pending') AS display_grade
FROM enrollments e;


-- ============================================================
-- 5. CASE WHEN - GRADE CLASSIFICATION
-- ============================================================

SELECT
    e.student_id,
    e.course_id,
    e.grade,
    CASE
        WHEN e.grade IS NULL THEN 'Not Graded'
        WHEN e.grade >= 90 THEN 'Excellent'
        WHEN e.grade >= 80 THEN 'Good'
        WHEN e.grade >= 60 THEN 'Pass'
        ELSE 'Fail'
    END AS grade_status
FROM enrollments e;


-- ============================================================
-- 6. STUDENTS WITH GRADE STATUS
-- Keep all students using LEFT JOIN.
-- ============================================================

SELECT
    s.name,
    s.surname,
    e.grade,
    CASE
        WHEN e.grade IS NULL THEN 'Not Graded'
        WHEN e.grade >= 90 THEN 'Excellent'
        WHEN e.grade >= 80 THEN 'Good'
        WHEN e.grade >= 60 THEN 'Pass'
        ELSE 'Fail'
    END AS grade_status
FROM students s
LEFT JOIN enrollments e
    ON e.student_id = s.student_id;


-- ============================================================
-- 7. CONDITIONAL COUNT
-- Count graded and pending enrollments.
-- ============================================================

SELECT
    SUM(
        CASE
            WHEN e.grade IS NOT NULL THEN 1
            ELSE 0
        END
    ) AS graded_count,

    SUM(
        CASE
            WHEN e.grade IS NULL THEN 1
            ELSE 0
        END
    ) AS pending_count

FROM enrollments e;


-- ============================================================
-- 8. COUNT GRADE CATEGORIES
-- ============================================================

SELECT
    SUM(CASE WHEN e.grade >= 90 THEN 1 ELSE 0 END)
        AS excellent_count,

    SUM(CASE WHEN e.grade >= 80 AND e.grade < 90 THEN 1 ELSE 0 END)
        AS good_count,

    SUM(CASE WHEN e.grade >= 60 AND e.grade < 80 THEN 1 ELSE 0 END)
        AS pass_count,

    SUM(CASE WHEN e.grade < 60 THEN 1 ELSE 0 END)
        AS fail_count,

    SUM(CASE WHEN e.grade IS NULL THEN 1 ELSE 0 END)
        AS pending_count

FROM enrollments e;


-- ============================================================
-- 9. STUDENT PERFORMANCE LEVEL
-- Calculate average first, then classify it.
-- ============================================================

SELECT
    s.name,
    s.surname,
    AVG(e.grade) AS average_grade,

    CASE
        WHEN AVG(e.grade) IS NULL THEN 'Not Graded'
        WHEN AVG(e.grade) >= 85 THEN 'High Performer'
        WHEN AVG(e.grade) >= 70 THEN 'Average'
        ELSE 'Needs Improvement'
    END AS performance_level

FROM students s
LEFT JOIN enrollments e
    ON e.student_id = s.student_id

GROUP BY
    s.student_id,
    s.name,
    s.surname;


-- ============================================================
-- 10. GRADED AND PENDING ENROLLMENTS PER DEPARTMENT
-- ============================================================

SELECT
    d.department_name,

    SUM(
        CASE
            WHEN e.grade IS NOT NULL THEN 1
            ELSE 0
        END
    ) AS graded_count,

    SUM(
        CASE
            WHEN e.enrollment_id IS NOT NULL
             AND e.grade IS NULL THEN 1
            ELSE 0
        END
    ) AS pending_count

FROM departments d
LEFT JOIN students s
    ON s.department_id = d.department_id
LEFT JOIN enrollments e
    ON e.student_id = s.student_id

GROUP BY
    d.department_id,
    d.department_name;


-- ============================================================
-- 11. MINI CHALLENGE
-- Display Pending instead of NULL.
-- ============================================================

SELECT
    s.name,
    s.surname,
    COALESCE(e.grade::text, 'Pending') AS display_grade
FROM students s
LEFT JOIN enrollments e
    ON e.student_id = s.student_id;


-- ============================================================
-- 12. SIMPLE STUDENT STATUS
-- ============================================================

SELECT
    s.name,
    s.surname,
    e.grade,

    CASE
        WHEN e.grade IS NULL THEN 'Not Graded'
        WHEN e.grade >= 85 THEN 'Successful'
        ELSE 'Needs Improvement'
    END AS grade_status

FROM students s
LEFT JOIN enrollments e
    ON e.student_id = s.student_id;


-- ============================================================
-- 13. GRADED AND PENDING COUNT PER COURSE
-- ============================================================

SELECT
    c.course_name,

    SUM(
        CASE
            WHEN e.grade IS NOT NULL THEN 1
            ELSE 0
        END
    ) AS graded_count,

    SUM(
        CASE
            WHEN e.enrollment_id IS NOT NULL
             AND e.grade IS NULL THEN 1
            ELSE 0
        END
    ) AS pending_count

FROM courses c
LEFT JOIN enrollments e
    ON e.course_id = c.course_id

GROUP BY
    c.course_id,
    c.course_name;


-- ============================================================
-- 14. COURSE STATUS
-- No Students / Waiting Grades / Completed
-- ============================================================

SELECT
    c.course_name,

    CASE
        WHEN COUNT(e.enrollment_id) = 0 THEN 'No Students'

        WHEN COUNT(e.enrollment_id) FILTER (
            WHERE e.grade IS NULL
        ) > 0 THEN 'Waiting Grades'

        ELSE 'Completed'
    END AS course_status

FROM courses c
LEFT JOIN enrollments e
    ON e.course_id = c.course_id

GROUP BY
    c.course_id,
    c.course_name;


-- ============================================================
-- 15. FINAL CHALLENGE
-- Enrollment statistics per department.
-- ============================================================

SELECT
    d.department_name,

    COUNT(e.enrollment_id) AS total_enrollments,

    SUM(
        CASE
            WHEN e.grade IS NOT NULL THEN 1
            ELSE 0
        END
    ) AS graded_count,

    SUM(
        CASE
            WHEN e.enrollment_id IS NOT NULL
             AND e.grade IS NULL THEN 1
            ELSE 0
        END
    ) AS pending_count

FROM departments d
LEFT JOIN students s
    ON s.department_id = d.department_id
LEFT JOIN enrollments e
    ON e.student_id = s.student_id

GROUP BY
    d.department_id,
    d.department_name

ORDER BY d.department_name;