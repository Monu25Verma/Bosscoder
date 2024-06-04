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
-- Like Operators (% --> modulo)
-- not case sensitive so either a or A 
select * from  customer
where name like 'a%'

select * from  customer
where name like '%a%'

select * from  customer
where name like '%a'

select * from customer where name  like '%a%';
select * from customer where name like 'm%u';
-- start with m and enf with u 

select * from customer where name not like '%n%';
-- not n in it 

select  * from customer where email like '%@%.com'; 
-- to check the vaild mail id 

select * from customer where name like 'M___%';
-- _ is used to check the single/ particulr character so use __
-- wildcard works on both % and __   

select * from customer where name like '____ %';
-- select the first name

select * from customer where name not like '% _';
-- retrive all customer whose last name does not have one character


select * from orders where order_date  like '2024%';
-- 1. Orders in the year 2024

select * from orders where order_id like '2';
-- 2. Order IDs containing '2'

select * from customer where name like  '_____';
-- 3. Retrieve all customers whose names have exactly five characters



select * from customer where name like '%a%' or name like '%e%' or name like '%i%' or name like '%o%' or name like '%u%';
-- retive that get all the vowels 
 

