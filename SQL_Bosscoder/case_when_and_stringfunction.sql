use coffe_shop;
show tables;
select * from customers;
select * from products;
select * from transactions;

-- Case when 
select * from transactions;

select name, city, 
case
when city = 'New york' then 'East cost'
when city = 'Los Angeles' then 'West Coast' 
else 'other'
end as region
from customers;
#1-- write a query that selects customer name, city and adds a new column named region. 
-- It uses a CASE statement to categorize customers based on their city. 
-- Customers from New York will be assigned 'East Coast', Los Angeles will 
-- be 'West Coast', and everyone else will be 'Other'

select c.name, t.total_amount,
case
when t.total_amount> 200 then 'VIP' 
else 'Regular'
end AS VIP_status
from transactions t
inner join customers c
on t.customer_id = c.customer_id;

#-- 2.Write a query that retrieves the following information:

-- Customer name (from customers)
-- Order total amount (from transactions)
-- VIP status (based on total spending):
-- "VIP" if total spending across all orders is above $200
-- "Regular" otherwise 


select p.product_name, t.transaction_id, p.price,
case when c.city in ('New York', 'Boston', 'Miami') then 0.85*p.price
else 0.9*p.price end as 'Discounted price'
from products p
inner join transactions t on p.product_id = t.product_id
inner join customers c on c.customer_id = t.customer_id ;
-- 3. Write a query that retrieves the following information:
-- Product name (from products)
-- Transaction city (from customers joined with transactions)
-- Original price (from products)
-- Discounted price:
-- Apply a 15% discount for products priced over $50 in cities on the "East Coast" (predefined list: 'New York', 'Boston', 'Miami')
-- Apply a 10% discount for all other products 

select  c.name, p.product_name,  t.total_amount from customers c
inner join transactions t on c.customer_id = t.customer_id
inner join products p on p.product_id = t.product_id
where t.total_amount > 100 
order by c.customer_id, t.transaction_date desc
limit 1;

-- 1. Write a query that retrieves the following information for each customer:
-- Customer name (from customers)
-- Product name (from the most recent high-value transaction) - a high-value transaction is defined as one with a total amount exceeding $100
-- Total amount of the most recent high-value transaction

select c.name, p.product_name, t.transaction_date,
case
when transaction_date < Date_SUB(CURDATE(), Interval 30 DAY) then 'Yes'
else 'NO' end as overdue_flag
from customers c
inner join transactions t on t.customer_id = c.customer_id
inner join products p on t.product_id = p.product_id;

-- 2. Write a query that retrieves the following information for each transaction:
-- Customer name (from customers)
-- Product name (from products)
-- Transaction date (from transactions)
-- Overdue flag:
-- "Yes" if the transaction date is older than 30 days from today's date
-- "No" otherwise

-- STRING FUNCTION 
select length(city) from customers;

select upper(Name) AS upper_case , lower(city) AS lower_case
from customers;

-- extracting string 
select substr(name, 1) AS part_of_name
from customers;
-- get the full name 
select substr(name, 1,4) AS part_of_name
from customers;
-- 1,4 --> starting and ending u want 

select left(name, 5) AS first_name_from_left
from customers;
-- display the value from left side 

select right(name, 5) AS rlast_name_from_left
from customers;
-- display the value from left side

select concat(name, " - ", city) AS concatenated_concat
from customers;
-- concat the name and city 

-- find the postion where space is present in string
select instr(email, " ") as space_position
from customers 

select instr(email, ".") as space_position
from customers ;
-- frind the . from string 

select trim(name) from customers;
-- trim that will help u to remove the extra spaces from string 

select name, upper(left(name,1)) AS left_char ,upper(substr(name, instr(name," ")+1,1)) AS right_char,
concat(upper(left(name,1)),".",upper(substr(name, instr(name," ")+1,1))) AS concatinated,
concat(upper(left(city,1)),lower(substr(city,2))) AS Concated
from customers;
select name from customers;
-- -- 5. Customer name (from customers)
-- Customer initials (first letter of first name and 
-- last name)
-- City name (from customers) with the first letter capitalized and 
-- the rest in lowercase 


select city,
substr(city,1,4), substr(city,1), substr(city,2),
substr(city, instr(city, " ")+1,1)
from customers;

-- write a quesry that retrives custoemr email from customer, email domain (everting after '@' symbol)
-- username (everything before the @ symbol)  

select substr(email, instr(email, '@') +1) AS domain 
, left(email, INSTR(email, '@')-1) AS username
from customers;