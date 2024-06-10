-- SUBQUERY

select c.name, email from customers
where customer_id = (select customer_id from transactions
order by total_amount desc limit 1); 
-- Find the email of the customer  who has made transactions

select name, email from customers
where customer_id  = (select  customer_id from transactions
group by customer_id
order by sum(total_amount)  desc limit 1);
-- 1. Retrieve the name and email of the customer who has 
-- the highest total spending across all transactions 


select product_name from products
where product_id  NOT IN (select DIstinct product_id from transactions
);
-- 2. Identify the names of products that have never been purchased

select name from customers
where customer_id IN (select  customer_id from transactions
group by customer_id
having count(distinct transaction_date) > 1
);
-- 3. List the names of customers who have made transactions on 
-- more than one distinct date 

select name, email from customers
where customer_id IN (select customer_id from transactions
where total_amount > 200
group by customer_id
having count(transaction_id) > 2
);
-- 4. List the names and emails of customers who have made more than 
-- two transactions, each exceeding $200 


select product_id, product_name from products
where product_id = (select product_id from customers
group by  product_id
order by count(distinct customer_id) desc limit 1);
-- 5. Retrieve the name of the product that has been purchased by the 
-- highest number of distinct customers


select city, count(customer_id) AS cnt_city from customers
group by city
having count(customer_id) > 2
-- 6. List the city name and the count of customers for cities that have more 
-- than 2 customers


-- HOMEWORK 
-- 1. Identify products that have been purchased exactly once
-- 2. Find the names of customers who have purchased tv the most
 
