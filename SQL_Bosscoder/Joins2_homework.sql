
use university
create database university;

create table faculty(
FID int primary key,
FName varchar(50) NOT NULL,
Salary float,
DepartmentID int not null 
);
-- TASK 1: Create a table Faculty with the following schema:
-- Attributes: FID, FName, Salary, DepartmentID

INSERT INTO faculty (FID, FName, Salary, DepartmentID)
VALUES
    (100, 'Sam', 100000.00, 1),
    (101, 'John', 80000.00, 1),
    (102, 'Max', 90000.00, 2),
    (103, 'Jenny', 50000.00, 2);

create table Student(
SID int primary key,
FName varchar(50) NOT NULL,
LName varchar(50),
DepartmentID int not null 
);
-- TASK 2: Create a table Student with the following schema:
-- Attributes: SID, FName, LName, DepartmentID

INSERT INTO Student (SID, FName, LName, DepartmentID)
VALUES
    (1001, 'Alice', 'Smith', 1),
    (1002, 'Bob', 'Johnson', 2),
    (1003, 'Carol', 'Brown', 1),
    (1004, 'David', 'Lee', 2);
 
 create table Department(
DepartmentID int primary key,
DepartmentName varchar(50) NOT NULL
);
-- TASK 3: Create a table Department with the following schema:
-- Attributes: DepartmentID, DepartmentName
 
 INSERT INTO Department (DepartmentID, DepartmentName)
VALUES
    (1, 'Computer Science'),
    (2, 'Mathematics'),
    (3, 'Physics');
 
create table Course(
CourseID int primary key,
Name varchar(50) NOT NULL,
ProfessorID int
);
-- TASK 4: Create a table Course with the following schema:
-- Attributes: CourseID, Name, ProfessorID

INSERT INTO Course (CourseID, Name, ProfessorID)
VALUES
    (101, 'Introduction to Programming', 1),
    (102, 'Linear Algebra', 2),
    (103, 'Quantum Mechanics', 3);

create table Opted(
OptedID int primary key,
CourseID int,
StudentID int
);
-- TASK 5: Create a table Opted with the following schema:
-- Attributes: OptedID, CourseID, StudentID
 
 INSERT INTO Opted (OptedID, CourseID, StudentID)
VALUES
    (1, 101, 1001),
    (2, 102, 1002),
    (3, 103, 1003),
    (4, 101, 1004);

 
select DepartmentID from faculty 
union
select DepartmentID from Student; 
select f.FID, f.FName, f.salary from faculty f
where f.position = 'HOD';
 -- TASK 6: Display all the department numbers available with the Faculty and STUDENT tables avoiding duplicates.
-- List the F ID, first name, Salary of all Faculty working as HOD.

select DepartmentID from faculty 
union ALL
select DepartmentID from Student;
select f.FID, f.FName, f.salary from faculty f;
-- TASK 7: Display all the department numbers available with the Faculty and STUDENT tables without avoiding duplicates. 
 
select DepartmentID from faculty 
Except
select DepartmentID from Student;

select DepartmentID from Student;
Except
select DepartmentID from faculty 
 -- TASK 8:Display all the department numbers available with the Faculty but not in the STUDENT table and vice versa. 
 
alter table faculty add column position varchar(50);
update faculty set  position = 'HOD' where FID = 100;
update faculty set  position = 'Manager' where FID = 101;
update faculty set  position = 'Principal' where FID = 102;
update faculty set  position = 'Teacher' where FID = 103;


select * from faculty;
select * from student;
select * from Department;
select * from Course;
select * from Opted;

