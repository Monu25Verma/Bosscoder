-- DDL commands (create, alter, drop, truncate) 
alter table customer add city varchar(50);
-- to alter the table 

alter table customer drop column city;
-- drop a column 

alter table customer rename column name to c_name;
-- rename column

alter table customer change c_name cust_name varchar(50);
-- change the column name 
-- (diffrence between rename and change your datatype in change)

alter table cust rename to customer; 
-- alter the table name 
set sql_safe_updates  = 0;

update orders set order_amount = 200.0 where order_id = 1
-- update the order_amount

update orders set order_amount  = 250.00 where order_date = '2024-05-14' 
-- update the order amount 

drop table customer;
-- delete a table 

drop database superstore;
-- delete database 

truncate table orders;
-- remove all the rows from table (fastest way to empty the memory by deleting the orders) 

delete from orders where order_id = 4;
-- delete the particular row from table 

alter table customer add  city varchar(50);

insert into customer(cust_id, cust_name, email, city) values
(1, "Monu", "monu.do@gmail.com", 'mumbai'),
(5, "hitesh", "hitesh.do@gmail.com", 'mumbai'),
(8, "papa", "papa.do@gmail.com", 'mumbai'),
(10, "didu", "didi.do@gmail.com", 'mumbai');

delete from customer where cust_id = Null;

insert into customer(cust_id, cust_name, email, city) values(
10, "Monu", "monu.do@gmail.com", 'mumbai')

insert into customer(cust_id,  city) values(
11,  'mumbai')

select * from orders
order by order_amount;
-- order by

select * from customer 
order by cust_id
limit 5; 
-- order by with limit 

select * from orders
order by order_amount DESC
LIMIT 1;


delete from customer where city = 'mumbai' and email is Null;