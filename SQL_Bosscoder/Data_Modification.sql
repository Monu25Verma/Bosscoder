-- Task 1: Write a query to find students whose names match a specific pattern using REGEXP.
select name from student where name regexp 'pattern';

-- Task 2: Write a query to find students with missing information, where certain fields are NULL.
select * from student 
where (sid is NULL or name IS NULL or DOB is NULL or cgpa is NULL or city is NULL);

-- Task 3: Write a query to view the list of students in order of their CGPA.
select * from student 
order by cgpa desc

-- Task 4: Write a query to display a limited number of student records (e.g., top 5) based on CGPA.
select * from student
order by cgpa desc limit 5 

-- Task 5: Write a query to delete the record of the student with sid 'CS03'.

delete from student where sid = 'CS03'
or 
delete from student where sid = 3;

-- Task 6: Write a query to change the city of students with sid 'CS04' to Kolkata.
 update student set city = 'Kolkata' where sid = 4;
 
 -- Task 7: Write a query to add a new column named 'percent' and store corresponding CGPAs in percent by multiplying with 100.
alter table student Add column percent float;
update student set percent = cgpa * 100
