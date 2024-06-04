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
 
 -- REGULAR Expression (Regexp) --> It is an operator, not case sensitive
-- it will behave of substring that chose a set to find from it 
select * from customer
where name regexp 'Monu';

select * from customer
where cust_id regexp  3

 -- by using REGEXP
 select * from customer where name regexp '[aeiou]';

select * from customer where name regexp '[abcd]';
-- retrive all the customer date whose has any of these character  a,b,c,d

select * from customer where not name  regexp '[^aeiou]';
 -- not operator that will print all name that atleast one consonents
 -- retirve all the costumer that has any consonents 
 
 
 -- ANCHOR  --> special character to match 
 select * from customer where name regexp '^[^aeiou]'
 -- it will give wose first name is consonants
 
 select  * from customer where name regexp '[^aeiou]$'
 -- $ is used to check  anchor end of the string
--  retieve the data  whose name last char is a consonants

select * from customer where name regexp '^[m]' and name regexp '[u]$'
-- name start with m and end with u
OR
select * from customer where name regexp '^A.*e$';

select * from customer where name regexp '\\jane\\b'
-- used as a single literal '\' in regexp then i need to add another \ here


select  name from customer where name regexp '^monu\\b'
-- name start with monu 

select name from customer where name regexp '\\bmonu$';
-- name end with monu
-- '\' --> escape char

 select  * from customer where cust_name regexp '[aeiou]$';
select  cust_name from customer where cust_name regexp '^(Emily)'
select  cust_name from customer where cust_name regexp '^Emily'
select  cust_name from customer where cust_name regexp '\\bEmily\\b'