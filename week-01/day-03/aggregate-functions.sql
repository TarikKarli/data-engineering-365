-- =========================================
-- Day 03 - Aggregate Functions and GROUP BY
-- =========================================
Select Count(*)
From students ;

Select Count(*)
From students
Where city='Istanbul' ;

Select Count(*)
From students
Where departmant ='Ceng';

Select Count(*)
From students
Where age = 22;

Select AVG(age)
From students;

Select Min(age)
From students;

Select Max(age)
From students;

Select Sum(age)
From students;

Select AVG(age)
From students
Where city='Istanbul';

Select departmant , Count(*)
From students
Group by departmant;

Select city , Count(*)
From students
Group by city;

Select city ,AVG(age) AS avarage_age
From students
Group by city ;

Select departmant, Max (age)
From students
Group by departmant;

Select departmant, Count(*) AS students_count
From students
Group by departmant
Order by students_count DESC;

Select city ,AVG(age) As students_avgAge
From students
Group by city
Order by students_avgAge DESC;

Select departmant ,Max(age) AS maxAge
From students
Group by departmant
Order by maxAge ASC;

Select departmant ,Count(*) as student_count
From students
Group by departmant
Having Count(*)>1;

Select departmant , Count(*) AS student_count
From students
Group by departmant
Having Count (*)>1;

Select city , AVG(age) AS student_avg_age
From students
Group by city
Having AVG(age) >21;

Select city ,Max(age) AS student_max_age
From students
Group by city
Having Max(age)>21;

Select city ,Count(*) AS student_count
From students
Where age >21
Group by city
Having Count(*)>1
Order by student_count DESC;

Select departmant, AVG(age) AS students_avg_age
From students
Where departmant IN('Ceng', 'EEE')
Group by departmant
Order by students_avg_age DESC;

Select departmant, Max(age) AS students_max
From students
Where city <> 'Istanbul'
Group by departmant
Having Max(age)>21 ;

Select city , Count(*) AS students_count
From students
Where age Between 21 and 22 
Group by city
Order by students_count DESC;
