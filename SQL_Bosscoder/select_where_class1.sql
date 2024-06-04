show databases
-- show all the databeses

create database superstore;
-- create a database to create table

use superstore;
-- to use specified database 

create table customer(
cust_id int,
name varchar(50),
email varchar(50)
);
-- create table customer 

create table orders(
order_id int,
cust_id int,
order_date date,
order_amount float
);
-- order table created 


insert into customer(cust_id, name, email) values
(1, "Monu", "monu.do@gmail.com"),
(2, "Swati", "swati.no@gmail.com"),
(3, "abhi", "abhi.go@gmail.com"),
(4, "shiva", "shiva.yo@gmail.com"),
(5, "anki", "anki.yo@gmail.com")
;
insert into customer(cust_id, name, email) values
(6, 'John Doe', 'john.doe@gmail.com'),
(7, 'Alice R', 'alice@yahoo.com') ,
(8, 'Jane Smith','smith.jane@gmail.com'),
(9, 'Emily Davis', 'emily123@rediffmail.com'),
(10, 'Bob Brown', 'bob_brown@gmail.com');
-- insert values to customer table

insert into orders(order_id, cust_id, order_date, order_amount) values
(1, 1, "2024-05-10", 100.50),
(2, 2, "2024-05-11", 150.60),
(3, 3, "2024-05-12", 10.90),
(4, 4, "2024-05-13", 140.00),
(5, 5, "2024-05-14", 107.00)
;
select * from customer;
select * from orders;
-- to get all data 

set sql_safe_updates  = 0;

insert into customer(cust_id, cust_name, email, city) values
(1, "Monu", "monu.do@gmail.com", 'mumbai');

update orders set order_amount = 200.0 where order_id = 1;

delete from orders where order_id = 4;

truncate table orders;

alter table customer drop column city;

drop database superstore;

drop table customer;

create table customer(
customer_id int primary key,
customer_name varchar(50)

select * from orders
age int,
city varchar(50)
);

create table order(
order_id int,
order_date date,
customer_id int,
order_amount int
foreign key(customer_id) refrences customer(customer_id))
-- foreign key way of writing 

