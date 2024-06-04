-- Task 1: Create a table with the given details and populate it with appropriate entries. 

create database student_details;
-- create a database 

use student_details
set sql_safe_updates  = 0;
create table student(
sid int primary key,
name varchar(50) not null,
DOB date not null,
cgpa float,
city varchar(50) 
);
-- create a table with columns

 insert into student(sid, name, DOB, cgpa, city) values
(1, "monu", "2023-10-12", 3.20, "Mumbai"),
(2, "Anki", "2024-10-12", 5.20, "Pune"),
(3, "shivam", "2020-10-12", 8.10, "kolkata"),
(4, "Rathodi", "2004-10-12", 10, "surat"),
(5, "monu vermy", "2000-01-01", 9.00, "Delhi"),
(6, "swati ashta", "1999-01-05", 6.20, "Mumbai")
-- insert the values inside the column 

-- Task 2: Write a query to display the CGPA of students whose DOB is <= '2000-01-01' AND CGPA >= 8.5 from the STUDENT table. 
select cgpa from student
where DOB <= '2000-01-01' and cgpa >= 8.5;
-- print the cgpa of student 

 -- Task 3: Write a query to find the CGPA of a student whose DOB is <= '2000-01-01' OR CGPA >= 8.5 from the STUDENT table.
 select cgpa from student 
where DOB <= '2000-01-01' or cgpa >= 8.5;
 
 -- Task 4: Write a query to find the student details who reside in 'IN' Kolkata or Delhi.
 select * from student where city IN(
"kolkata","Delhi");

-- Task 5: Write a query to find the student details who do not reside in 'IN' Kolkata or Delhi.
select * from student where city Not IN(
"kolkata","Delhi");

-- Task 6: Write a query to find the student details whose CGPA is BETWEEN 8.5 and 9.5.
select cgpa from student where cgpa between
8.5 and 9.5;

-- Task 7: Write a query to view the CGPA of students whose second letter in the name is 'a'
select cgpa from student where 
name LIKE '_a%';





