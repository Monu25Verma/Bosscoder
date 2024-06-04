-- Task 1: Create a database named "MyDB"
create database MyDB;

-- Task 2: Create 3 tables in the "MyDB" database.
create table employees(
name varchar(50),
phone_number varchar(50)
);

create table employee_post(
salary float,
positions varchar(50)
);

create table employee_info(
marital_status varchar(50),
date_of_birth Date,
residence varchar(50)
);

-- Task 3: Use the SELECT statement to retrieve data from the tables.
 select * from employees;
 select * from employee_post;
 select * from employee_info;

-- Task 4: Apply the SELECT clause to specify the columns to be retrieved.
select name, phone_number from employees;
select salary, positions from employee_post;
select date_of_birth, residence from employee_info;

-- Task 5: Implement the WHERE clause to filter data based on specific conditions. 
select * from employees where name = "John Doe";
select * from employee_post where salary > 40000;
select * from employee_info where marital_status = "Single" and date_of_birth > "1985-05-20";