Create Table departments(
  department_id Integer Primary Key,
  department_name Varchar(100) Not Null Unique,
  faculty Varchar(100) Not Null,
  active Boolean Default True 
);

 INSERT INTO departments
   (department_id,department_name,faculty,active) Values
    (1, 'Computer Engineering', 'Engineering', TRUE),
    (2, 'Electrical Engineering', 'Engineering', TRUE),
    (3, 'Law', 'Law Faculty', TRUE),
    (4, 'Physiotherapy', 'Health Sciences', TRUE);

	Select*
	From departments

	SELECT *
    FROM students;

	Alter Table students
	ADD column department_id INTEGER ;

	Select *
	From students;

	UPDATE students
	Set department_id=4
	Where name='Ali';

	Update students
	Set department_id=1
	Where name='Tarik';

	Update students
	Set department_id=1
	Where name ='Yusuf';

	Update students
	Set department_id=3
	Where name='Serdar';

	Update students
	Set department_id=2
	Where name='Baris';

	Select id,name,departmant,department_id
	From students;

	Alter table students
	ADD Constraint fk_students_department
	Foreign KEY (department_id)
	References departments(department_id);
Update students
Set department_id=2
Where name='Tarik';

Update students
Set department_id=99
Where name ='Tarik';



UPDATE students
SET department_id = 1
WHERE name = 'Tarik';

Select *
From students;

Select *
From departments;

Alter Table students
Drop Column departmant;
SELECT *
FROM students;

Alter table students
ADD Primary Key (id);

Alter table students
ADD Constraint check_student_age
Check (age >=17 AND age <=100);

Insert INTO students
  (id,name,surname,age,city,department_id) Values
  (6,'Mehmet','Emin',150,'Konya',1);

  Alter Table students
  Alter Column name Set Not Null;

Alter Table students
Alter Column surname Set Not Null;

ALTER TABLE students
ALTER COLUMN age SET NOT NULL;

ALTER TABLE students
ALTER COLUMN city SET NOT NULL;

ALTER TABLE students
ALTER COLUMN department_id SET NOT NULL;

INSERT INTO students
(id,name,surname,age,city,department_id)Values
(7,'Salih',NULL, 30,'Tokat',2);


 -------------------------------------------------



Create Table courses(
course_id INTEGER Primary Key,
course_code Varchar(20) Not Null Unique,
course_name Varchar(100) Not Null,
credits INTEGER NOT NULL  Check(credits Between 1 and 10),
department_id INTEGER NOT NULL
   REFERENCES departments(department_id),
active Boolean default true


);
INSERT INTO courses
(course_id, course_code, course_name, credits, department_id, active)
VALUES
(1, 'CENG101', 'Introduction to Programming', 6, 1, TRUE),
(2, 'CENG202', 'Database Systems', 6, 1, TRUE),
(3, 'EEE201', 'Circuit Analysis', 5, 2, TRUE);

Select *
From courses;

INSERT INTO courses
(course_id, course_code, course_name, credits, department_id)
VALUES
(4, 'CENG101', 'Another Course', 4, 1);
