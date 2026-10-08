\# Day 6 - SQL JOINs



\## Topics Covered



\- INNER JOIN

\- LEFT JOIN

\- RIGHT JOIN

\- FULL OUTER JOIN

\- IS NULL

\- Multi-table JOINs

\- COUNT(\*) vs COUNT(column)

\- Finding unmatched records



\## Key Concepts



\### INNER JOIN

Returns only matching rows from both tables.



\### LEFT JOIN

Keeps all rows from the left table and returns NULL when there is no match.



\### RIGHT JOIN

Keeps all rows from the right table.



\### FULL OUTER JOIN

Keeps all rows from both tables.



\### LEFT JOIN + IS NULL

Useful for finding records that do not have a match.



Examples:



\- students without enrollments

\- courses without students



\## Important Lesson



When using LEFT JOIN:



`COUNT(\*)` may count unmatched rows.



`COUNT(column)` ignores NULL values and is better when counting matched records.



\## Practice Completed



\- Find students without courses

\- Find courses without students

\- Count students per course

\- Count courses per department

\- Multi-table JOIN practice

\- Find students taking courses outside their department

