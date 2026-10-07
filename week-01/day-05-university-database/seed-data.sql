-- =============================================
-- University Database Project
-- Seed Data
-- =============================================


-- =============================================
-- Departments
-- =============================================

INSERT INTO departments
(department_id, department_name, faculty, active)
VALUES
(1, 'Computer Engineering', 'Engineering Faculty', TRUE),
(2, 'Electrical Engineering', 'Engineering Faculty', TRUE),
(3, 'Law', 'Law Faculty', TRUE),
(4, 'Physiotherapy', 'Health Sciences Faculty', TRUE);


-- =============================================
-- Students
-- =============================================

INSERT INTO students
(student_id, name, surname, age, city, department_id)
VALUES
(1, 'Ali', 'Cubuk', 22, 'Istanbul', 4),
(2, 'Tarik', 'Karli', 22, 'Istanbul', 1),
(3, 'Baris', 'Bal', 21, 'Balikesir', 2),
(4, 'Yusuf', 'Gumus', 22, 'Hatay', 1),
(5, 'Serdar', 'Kilicarslan', 22, 'Malatya', 3);


-- =============================================
-- Courses
-- =============================================

INSERT INTO courses
(course_id, course_code, course_name, credits, department_id, active)
VALUES
(1, 'CENG101', 'Introduction to Programming', 6, 1, TRUE),
(2, 'CENG202', 'Database Systems', 6, 1, TRUE),
(3, 'CENG203', 'Operating Systems', 6, 1, TRUE),
(4, 'EEE201', 'Circuit Analysis', 5, 2, TRUE),
(5, 'LAW101', 'Introduction to Law', 4, 3, TRUE),
(6, 'FTR101', 'Anatomy', 5, 4, TRUE);


-- =============================================
-- Enrollments
-- =============================================

INSERT INTO enrollments
(enrollment_id, student_id, course_id, enrollment_date, grade)
VALUES
(1, 2, 1, '2026-10-01', 85),
(2, 2, 2, '2026-10-01', 90),
(3, 4, 1, '2026-10-02', 78),
(4, 4, 3, '2026-10-02', 88),
(5, 3, 4, '2026-10-03', 81),
(6, 5, 5, '2026-10-03', 92),
(7, 1, 6, '2026-10-04', 76),
(8, 3, 2, '2026-10-04', 84);