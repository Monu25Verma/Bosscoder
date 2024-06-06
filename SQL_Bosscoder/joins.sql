use coffe_shop;

create database coffe_shop;

-- Create customers table
CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    name VARCHAR(100),
    email VARCHAR(100),
    city VARCHAR(100)
);

-- Create products table
CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100),
    price float(10)
);

-- Create transactions table
CREATE TABLE transactions (
    transaction_id INT PRIMARY KEY,
    customer_id INT,
    product_id INT,
    transaction_date DATE,
    quantity INT,
    total_amount DECIMAL(10, 2),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

-- Insert data into customers table
INSERT INTO customers (customer_id, name, email, city) VALUES
(1, 'John Doe', 'john.doe@gmail.com', 'New York'),
(2, 'Alice R', 'alice@yahoo.com', 'Los Angeles'),
(3, 'Jane Smith', 'smith.jane@gmail.com', 'Delhi NCR'),
(4, 'Emily Davis', 'emily123@rediffmail.com', 'Sydney'),
(5, 'Bob Brown', 'bob_brown@gmail.com', 'Bangalore'),
(6, 'Charlie Wilson', 'charlie.w@gmail.com', 'London'),
(7, 'David Harris', 'david.harris@yahoo.com', 'Paris'),
(8, 'Eva Johnson', 'eva.j@hotmail.com', 'Berlin'),
(9, 'Frank Clark', 'frank.c@gmail.com', 'Tokyo'),
(10, 'Grace Lewis', 'grace.l@yahoo.com', 'Dubai'),
(11, 'Henry Walker', 'henry.walker@hotmail.com', 'Toronto'),
(12, 'Ivy Hall', 'ivy.h@gmail.com', 'San Francisco'),
(13, 'Jack Young', 'jack.y@gmail.com', 'Chicago'),
(14, 'Kathy Baker', 'kathy.b@gmail.com', 'Boston'),
(15, 'Leo Turner', 'leo.t@yahoo.com', 'Miami'),
(16, 'Mia Phillips', 'mia.p@hotmail.com', 'Houston'),
(17, 'Noah Lee', 'noah.l@gmail.com', 'Atlanta'),
(18, 'Olivia King', 'olivia.k@gmail.com', 'Seattle'),
(19, 'Paul Scott', 'paul.s@yahoo.com', 'Austin'),
(20, 'Quincy Adams', 'quincy.a@hotmail.com', 'Denver');

-- Insert data into products table
INSERT INTO products (product_id, product_name, price) VALUES
(1, 'Laptop', 1000.00),
(2, 'Smartphone', 700.00),
(3, 'Tablet', 400.00),
(4, 'Headphones', 100.00),
(5, 'Smartwatch', 200.00),
(6, 'Camera', 500.00),
(7, 'Printer', 150.00),
(8, 'Monitor', 300.00),
(9, 'Keyboard', 50.00),
(10, 'Mouse', 30.00),
(11, 'Speaker', 120.00),
(12, 'Router', 80.00),
(13, 'Hard Drive', 100.00),
(14, 'USB Drive', 20.00),
(15, 'Power Bank', 60.00),
(16, 'Charger', 25.00),
(17, 'Webcam', 70.00),
(18, 'Microphone', 90.00),
(19, 'Projector', 600.00),
(20, 'TV', 800.00);

-- Insert data into transactions table
INSERT INTO transactions (transaction_id, customer_id, product_id, transaction_date, quantity, total_amount) VALUES
(1, 1, 1, '2024-05-01', 1, 1000.00),
(2, 2, 2, '2024-05-02', 1, 700.00),
(3, 3, 3, '2024-05-03', 2, 800.00),
(4, 4, 4, '2024-05-04', 1, 100.00),
(5, 5, 5, '2024-05-05', 1, 200.00),
(6, 6, 6, '2024-05-06', 1, 500.00),
(7, 7, 7, '2024-05-07', 1, 150.00),
(8, 8, 8, '2024-05-08', 1, 300.00),
(9, 9, 9, '2024-05-09', 3, 150.00),
(10, 10, 10, '2024-05-10', 2, 60.00),
(11, 11, 11, '2024-05-11', 1, 120.00),
(12, 12, 12, '2024-05-12', 2, 160.00),
(13, 13, 13, '2024-05-13', 1, 100.00),
(14, 14, 14, '2024-05-14', 5, 100.00),
(15, 15, 15, '2024-05-15', 1, 60.00),
(16, 16, 16, '2024-05-16', 1, 25.00),
(17, 17, 17, '2024-05-17', 1, 70.00),
(18, 18, 18, '2024-05-18', 2, 180.00),
(19, 19, 19, '2024-05-19', 1, 600.00),
(20, 20, 20, '2024-05-20', 1, 800.00);
drop table products;
show tables;
select * from customers;
select * from products;
select * from transactions;

select c.customer_id , c.name, c.city, t.quantity from customers c
inner join transactions t
on c.customer_id = t.customer_id
where t.quantity = 2;
-- inner join

select c.*, t.*  from customers c  -- (.* print all the data) 
inner join transactions t
on c.customer_id = t.customer_id
where t.quantity = 2;

INSERT INTO customers (customer_id, name, email, city) VALUES
(21, 'monu Doe', 'monu.doe@gmail.com', 'New York'),
(22, 'swati Doe', 'sona.doe@gmail.com', 'Itlay');

INSERT INTO products (product_id, product_name, price) VALUES
(21, 'PC', 1000.00),
(22, 'MAC', 18000.00);

select p.product_name from products p
left join transactions t
on p.product_id = t.product_id;

select c.customer_id, t.transaction_date from customers c
left join transactions t
on c.customer_id  = t.customer_id;

select t.transaction_id, c.name, p.product_name
from transactions t
inner join customers c on   t.customer_id = c.customer_id
inner join products p on t.product_id = p.product_id;
-- retrieve all transaction along with customer name and product name

select t.transaction_id , c.name, c.customer_id from transactions t
left join customers c
On t.customer_id  = c.customer_id;
-- List all transactions along with the names of the customers who made those transactions. 

select t.transaction_id, c.name, t.total_amount from transactions t
inner join customers c
on t.customer_id  = c.customer_id
where t.total_amount > 500;
-- retrieve  all trasaction where trasaction amount is > 500
-- along with the customer name only for customer who made the transactions  

select c.* from customers c
left join transactions t 
on c.customer_id = t.customer_id
where t.transaction_id is Null;
--  Identify customers who have not made any transactions- 



-- Homework

select t.transaction_id, c.name, p.product_name from transactions t
left join customers c on t.customer_id = c.customer_id
left join products p on t.product_id = p.product_id
where t.transaction_date >= '2024-04-01' and t.transaction_date <= '2024-06-01';
-- Retrieve all transactions that occurred in May 2024, 
-- along with the names of the customers and products involved.

select c.name, p.product_id from customers c
inner join transactions t on c.customer_id = t.customer_id
inner join products p on  t.product_id = p.product_id
where p.product_name = 'Laptop';
-- -- List the names of customers who have purchased the product 'Laptop'. 

select c.* , t.* from customers c
left join transactions t on c.customer_id = t.customer_id
union
select c.* , t.* from customers c
right join transactions t on c.customer_id = t.customer_id;
-- retieve all the data instead of full outer join we do left + right join 

CREATE TABLE students (
    student_id INT PRIMARY KEY,
    name VARCHAR(100),
    email VARCHAR(100),
    age INT
);

INSERT INTO students (student_id, name, email, age) VALUES
(1, 'John Doe', 'john.doe@gmail.com', 20),
(2, 'Alice R', 'alice@yahoo.com', 22),
(3, 'Jane Smith', 'smith.jane@gmail.com', 19),
(4, 'Emily Davis', 'emily123@rediffmail.com', 21),
(5, 'Bob Brown', 'bob_brown@gmail.com', 23),
(6, 'Charlie Johnson', 'charlie.j@gmail.com', 22),
(7, 'Diana Prince', 'diana.p@amazon.com', 20),
(8, 'Edward Norton', 'edward.n@gmail.com', 24);


CREATE TABLE courses (
    course_id INT PRIMARY KEY,
    course_name VARCHAR(100),
    credits INT
);

INSERT INTO courses (course_id, course_name, credits) VALUES
(1, 'Mathematics', 4),
(2, 'Physics', 3),
(3, 'Chemistry', 4),
(4, 'Biology', 3),
(5, 'Computer Science', 4),
(6, 'English', 2),
(7, 'History', 3),
(8, 'Art', 2);



CREATE TABLE enrollments (
    enrollment_id INT PRIMARY KEY,
    student_id INT,
    course_id INT,
    enrollment_date DATE,
    FOREIGN KEY (student_id) REFERENCES students(student_id),
    FOREIGN KEY (course_id) REFERENCES courses(course_id)
);

INSERT INTO enrollments (enrollment_id, student_id, course_id, enrollment_date) VALUES
(1, 1, 1, '2024-01-15'),
(2, 2, 2, '2024-01-16'),
(3, 3, 3, '2024-01-17'),
(4, 4, 4, '2024-01-18'),
(5, 5, 5, '2024-01-19'),
(6, 6, 6, '2024-01-20'),
(7, 7, 7, '2024-01-21'),
(8, 8, 8, '2024-01-22'),
(9, 1, 2, '2024-02-15'),
(10, 2, 3, '2024-02-16'),
(11, 3, 4, '2024-02-17'),
(12, 4, 5, '2024-02-18'),
(13, 5, 6, '2024-02-19'),
(14, 6, 7, '2024-02-20'),
(15, 7, 8, '2024-02-21'),
(16, 8, 1, '2024-02-22');

INSERT INTO courses (course_id, course_name, credits) VALUES
(9, 'Data Science', 4);

select * from students;
select * from courses;
select * from enrollments;

select distinct c.course_name from courses c
inner join enrollments e on c.course_id = e.course_id;
-- List all couses that have at least one student enrolled 


select distinct s.name, c.course_name from students s
inner join enrollments e on s.student_id = e.student_id
inner join courses c on c.course_id = e.course_id;

select s.name from students s
inner join enrollments e on s.student_id = e.student_id
inner join courses c on c.course_id = e.course_id
where c.course_name = 'Mathematics';
-- List the names of students who are enrolled in the 'Mathematics' course 

select s.name, e.enrollment_date from students s
inner join enrollments e on s.student_id = e.student_id
order by e.enrollment_date desc
limit 1;
-- Retrieve the name of the student who enrolled in the most recent course 

select c.course_name from courses c
left join enrollments e on c.course_id = e.course_id
where e.enrollment_id is NUll;
-- Find the courses that have not been enrolled in at al 

CREATE TABLE colors (
    color_id INT PRIMARY KEY,
    color_name VARCHAR(50)
);


CREATE TABLE shapes (
    shape_id INT PRIMARY KEY,
    shape_name VARCHAR(50)
);


INSERT INTO colors (color_id, color_name) VALUES
(1, 'Red'),
(2, 'Green'),
(3, 'Blue');


INSERT INTO shapes (shape_id, shape_name) VALUES
(1, 'Circle'),
(2, 'Square'),
(3, 'Triangle');

select * from colors;
select * from shapes;


select s.shape_name, c.color_name from colors c
cross join shapes s;

select s.name, c.course_name from students s
cross join courses c;
--  perform cross join on student and course name


select p.product_name from products p
inner join transactions t on p.product_id = t.product_id
inner join customers c on c.customer_id = t.customer_id
order by p.product_name;
-- List the products along with the names of customers who ordered them, sorted by product name 


select c.name AS customer_name, p.product_name from customers c
cross join products p; 
-- List all possible pairs of customers and product 

select t.transaction_id, c.name, p.product_name from transactions t
left join  customers c on t.customer_id = c.customer_id
left join  products p on t.product_id = p.product_id;
--  1. Write a query to list all transactions along with the customer names and product names

select p.* from products p
inner join transactions t on p.product_id  = t.product_id
where t.product_id is NUll;
-- 2. Write a query to list all products that have never been purchased by any customer

select p.* from products p
inner join transactions t on p.product_id  = t.product_id
inner join customers c on c.customer_id = t.customer_id
where p.product_name is not NULL;	
-- 3. Write a query to find the products that have been purchased by every customer

