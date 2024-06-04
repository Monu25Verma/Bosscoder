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

select * from customer where cust_id = 3;
select * from customer where cust_id > 3;
select * from customer where cust_id <> 3; -- not equal to
select * from customer where cust_id >= 3;
-- Applying the conditions 

select * from customer where cust_id = 3 or cust_id = 5;
-- OR
select * from customer where cust_id IN (1,3);
-- in operator (Membership operator)
select * from customer where cust_id not IN (1,3);
-- not in operator 
select * from customer where cust_id > 1 and cust_id <= 4;

select * from customer where cust_id between 1 and 3;
--  between operator and the range is inclusive 


select * from orders where order_amount > 100;

select * from customer where cust_id % 2 != 0;
select * from customer where mod(cust_id, 2) <> 0;

select * from orders where order_date between "2024-05-10"and "2024-05-12";

select  * from orders where order_amount between 50 and 150;
select * from orders where order_date  = "2024-05-10";