CREATE TABLE students(
	id INTEGER,
	name VARCHAR(50),
	surname VARCHAR(50),
	age INTEGER,
	departmant VARCHAR(100),
	city VARCHAR(50)
	
	
    );

INSERT INTO students
VALUES
(1, 'Ali', 'Cubuk', 22, 'FTR', 'Istanbul'),
(2, 'Tarik', 'Karli', 22, 'Ceng', 'Istanbul'),
(3, 'Baris', 'Bali', 21, 'EEE', 'Balikesir'),
(4, 'Yusuf', 'Gumus', 22, 'Ceng', 'Hatay'),
(5, 'Serdar', 'Kilicarslan', 22, 'Hukuk', 'Istanbul');


Select *
From students;

TRUNCATE TABLE students;

Select  name
From students 

Select name , surname 
From students;

Select name , city, age
From students;

Select departmant
From students;

Select *
From students;

Select Distinct city 
From students ;

Select Distinct departmant
From students;

Select name , city
From students;

Select surname , departmant 
From students ;

Select Distinct age 
From students ;

Select DISTINCT city , departmant
From students;

Select *
From students;

Select *
From students
Where city= 'Istanbul';

Select name , surname 
From students
Where age=22;

Select *
From students
Where departmant= 'Ceng';

Select *
From students
Where age > 21 ;

Select *
From students
Where city <> 'Istanbul' ;

Select name , age , city 
From students
Where age <22 ;

Select *
From students
Where city='Istanbul'
And age=22 ;

Select *
From students
Where departmant= 'Ceng'
And city='Istanbul' ;

Select *
from students
where city='Istanbul'
or city ='Hatay' ;

Select name , surname , age 
From students
Where age =21 OR age =22 ;

Select  *
From students
Where city <> 'Istanbul' and age >21 ;

Select *
From students
Where city IN ('Istanbul', 'Balikesir');

Select *
From students
Where departmant IN ('Ceng', 'EEE');

Select name , surname , age
From students
Where age IN (21,22);

Select *
From Students
Where age Between 21 And 22 ;

Select name ,surname , age
From students
Where age Between 20 And 22 ;

Select *
From students
Where id Between 2 And 4 ;

Select *
From students
Where name Like 'A%' ;

Select *
From students
Where name Like '%r' ;

Select *
From students
Where name Like '%li%' ;

Select name , city
From students
Where city Like 'I%' ;

Select name ,surname , city
From students
Where city = 'Istanbul' And age =22 ;

Select *
From students
Where departmant IN ('Ceng' , 'EEE');

Select name , city
From students 
Where city <> 'Istanbul' ;

Select name , age, departmant
From students
Where age Between 21 AND 22 ;

Select *
From students
Where name Like 'A%' ;

Select name , surname 
From students 
Where surname Like '%li%' ;

Select *
From students 
Where city IN ('Istanbul' , 'Hatay', 'Balikesir');

Select *
From students
Where id Between 2 And 5 
And city = 'Istanbul' ;
