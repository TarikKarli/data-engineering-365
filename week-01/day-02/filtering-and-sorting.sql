Select*
From students
Where city='Istanbul' ;

Select name , age
From students
Where age Between 21 And 22

Select *
From students
Where departmant In ('Ceng' , 'EEE');

Select *
From students
Where name Like ('A%') ;

Select *
From students
Order by age ASC ;

Select *
From students
Order by age DESC ;

Select name , surname 
From students
Order by name ASC ;

Select *
From students
Order By id DESC ;

Select *
From students 
Order by age ASC , name ASC ;

Select *
From students
Order by city DESC , age DESC ;

Select name , age, city 
From students
Order by city ASC , name ASC ;

Select *
From students
Where departmant ='Ceng'
Order by age DESC ;

Select *
From students
LIMIT 3;

Select*
From students
Order by age DESC
LIMIT 2;

Select name , surname 
From students
Order by name ASC 
LIMIT 3;

Select *
From students
Where city ='Istanbul'
Order by age DESC 
LIMIT 2 ;

Select *
From students
Where city IN ('Istanbul', 'Hatay')
Order by name ASC ;

Select *
From students
Where age Between 21 And 22
Order by age DESC ;

Select name ,surname, age
From students
Where departmant ='Ceng'
Order by name ASC;

Select *
From students
Where city <> 'Istanbul'
Order by id DESC;

Select name , age,citY
From students
Order by age DESC
LIMIT 3 ;

Select *
From students
Where name Like 'A%'
Order by name ASC;

Select *
From students
Where Departmant IN ('Ceng', 'EEE')
Order by age DESC
LIMIT 2;

Select name ,surname, city
From students
Where city ='Istanbul'
Order by name, surname,city ASC;

Select Distinct city 
From students
Order by city ASC;

Select *
From students
Where id Between 2 and 5
Order by id DESC
LIMIT 2;
