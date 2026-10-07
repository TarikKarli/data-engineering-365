\# University Database Project



This project is the final project of Week 1 of my 365-day Data Engineering journey.



\## Project Goal



The goal of this project is to design a relational university database using PostgreSQL and analyze the data using SQL.



\## Database Structure



The project contains four main tables:



\- departments

\- students

\- courses

\- enrollments



The `enrollments` table acts as a bridge table between students and courses and represents a many-to-many relationship.



\## Relationships



\- One department can have many students.

\- One department can have many courses.

\- One student can enroll in many courses.

\- One course can have many students.



\## Concepts Practiced



\- CREATE TABLE

\- PRIMARY KEY

\- FOREIGN KEY

\- NOT NULL

\- UNIQUE

\- CHECK

\- DEFAULT

\- INSERT INTO

\- SELECT

\- WHERE

\- JOIN

\- GROUP BY

\- HAVING

\- ORDER BY

\- COUNT()

\- AVG()

\- MIN()

\- MAX()



\## Project Files



\### schema.sql



Contains the database schema and table relationships.



\### seed-data.sql



Contains sample data for departments, students, courses and enrollments.



\### queries.sql



Contains business queries and analytical SQL exercises.



\## Example Questions



Some of the questions answered in this project:



\- How many students are in each department?

\- Which courses does each student take?

\- What is the average grade of each student?

\- What is the average grade of each course?

\- Which courses have at least two students?

\- Which students have an average grade above 85?

\- What is the average student grade for each department?



\## Technologies



\- PostgreSQL 18

\- pgAdmin 4

\- SQL

\- Git

\- GitHub



\## What I Learned



This project helped me understand how relational database tables are connected using primary and foreign keys.



I also practiced using JOIN operations together with aggregate functions such as COUNT, AVG, MIN and MAX.



One of the most important concepts I learned was the difference between WHERE and HAVING:



\- WHERE filters rows before grouping.

\- HAVING filters groups after GROUP BY.



\## Data Engineering 365



Week 1 - SQL Fundamentals ✅

