-- Group BY with aggregation(sum, count,max, min, avg)
-- it also count null ---> so use not null in where condn
select count(*)  from transactions;

-- considerd a null value also
select count(*)  from transactions
where transaction_id is not NULL;

-- count only non-null values 
select count(1)  from transactions
where transaction_id is not NULL;

select sum(total_amount) from transactions;

select customer_id, sum(total_amount) AS amount
from transactions
group by customer_id
order by amount desc;
-- find the total amount spent by each customer 

select customer_id, product_id, sum(total_amount) as amount
from transactions
group by customer_id, product_id
order by amount desc;

INSERT INTO transactions (transaction_id, customer_id, product_id, transaction_date, quantity, total_amount) VALUES
(23, 20, 4, '2024-06-01', 1, 2200.00),
(24, 4, 20, '2024-05-20', 1, 7680.00);

select c.name, count(t.transaction_id) AS product_purchase
from customers c
inner join transactions t on c.customer_id  = t.customer_id
group by c.name
order by 2 desc;
-- 1. Number of Products Purchased by Each Customer (customer_name) 


select p.product_name, avg(t.total_amount) AS avg_amount from transactions t
inner join products p on p.product_id =t.product_id
group by p.product_name
order by 2 desc;
-- -- 2. Average Transaction Amount by Product_name 
select * from customers;
select * from products;
select * from transactions where product_id = 1;

-- unique counts
select count(customer_id) AS total_cust, count(distinct customer_id) AS total_unique_cust
from transactions;

select c.name, max(t.total_amount) AS tm from transactions t
inner join customers c on  c.customer_id = t.customer_id
group by  c.name
order by tm desc limit 1;
-- -- 4. Highest Transaction Amount per Customer_name 

select c.name, count(t.transaction_id) AS purschase_count from transactions t
inner join customers c on c.customer_id = t.customer_id
where transaction_date >= curdate() - interval 1 year
group by c.customer_id, t.product_id
order by purschase_count desc;
-- -- 5. Find the most loyal customers (those who have made the most purchases) 
-- for each product category in the past year 

select month(transaction_date) transaction_month, round(avg(total_amount),2) as avg_amount from transactions 
where year(transaction_date) = year(curdate())
group by month(transaction_date);
-- Find the average transaction amount for each month in the current year
 
select c.city, sum(t.total_amount) AS sum_amount from customers c
inner join transactions t on c.customer_id = t.customer_id 
where upper(c.city) like 's%' or  c.city  like 'B%'
group by c.city;
-- -- 8. List the total amount spent by customers who live in cities 
-- starting with the letter 'S' or 'B' 

select customer_id, transaction_id, avg(quantity) AS qnt from transactions 
group by transaction_id, customer_id;

-- 9. Calculate the Average Quantity of Products Sold per Transaction for 
-- Each Customer

select p.product_name, sum(t.quantity) AS total_quantity from products p
inner join transactions t on p.product_id = t.product_id
group by  p.product_name
order by total_quantity  desc;
-- 10. Calculate the total quantity sold for each product_name

select p.product_name, count(distinct t.customer_id) AS cnt from 
 transactions t
inner join products p on  p.product_id = t.product_id
group by p.product_name;
-- 11. List all products along with the number of unique customers who have 
-- purchased each product 

select customer_id, total _amount from transaction
where custoer_id % 2 <> 0
group by customer_id
having  sum(tota_amount) >= 200;


select customer_id, total _amount from transaction
where custoer_id % 2 <> 0
group by customer_id
having  sum(tota_amount) >= 200;
--  total amount minimumm 200 , find odd numer  of transactions

select p.product_name, count(transaction_id) as cnt_trans
from transactions t
inner join products p on p.product_id = t.product_id 
group by p.product_name
having count(transaction_id) >1;
--   find product has sold more than one transactions
