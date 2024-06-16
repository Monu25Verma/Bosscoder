use superstore;

select * from employees;
CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    employee_name VARCHAR(100),
    manager_id INT
);

INSERT INTO employees (employee_id, employee_name, manager_id) VALUES
(1, 'Alice', NULL),
(2, 'Bob', 1),
(3, 'Charlie', 1),
(4, 'David', 2),
(5, 'Eve', 2),
(6, 'Frank', 3);

select e1.employee_name AS employee_name, 
e2.employee_name AS manager_name from employees e1 
 join employees e2 on e1.employee_id = e2.manager_id; 
-- Retrieve the list of employees and their corresponding managers

-- lst employee how are not mnager
select e1.employee_name AS employee_name, e2.employee_name AS manager_name
from employees e1
left join employees e2 on e1.employee_id = e2.manager_id
where e2.employee_name is NULL;
 
select e1.employee_name  AS manager_name
from employees e1
join employees e2 on e1.employee_id = e2.manager_id;
-- display the manager

select e1.employee_name AS manger_name from employees e1
inner join employees e2 
on e1.employee_id = e2.manager_id
group by e1.employee_name  				-- or group by 1  				
having count(e1.employee_id) > 1;
-- List all managers who manage  to have more than one employee


-- CTE(common table expression) fastest way to find the o/p
use coffe_shop;
select * from customers;
select product_name, count(product_id) from products
group by product_name;
select * from transactions;

-- write a query to find the odd customer id 
with cte AS
(
	select customer_id from customers
	where customer_id % 2 <> 0 
)
	select * from transactions
	where customer_id IN (select distinct customer_id from cte);

-- 1. Find the average price of products purchased by customers from 'New York'.

with cte AS(
select distinct customer_id from customers
where city = 'NEw yORK'
)
select AVG(price) AS avg_price from transactions t
inner join products p on t.product_id =  p.product_id
inner join cte on t.customer_id = cte.customer_id;

with cte as(
select  * from products 
)
select  max(total_amount*price) AS total_amount  from transactions t
inner join  cte on t.product_id = cte.product_id;
--  group by total_amount  desc 

-- 1.Identify the product with the highest total sales amount.

with cte as(
select * from customers 
)
select cte.name from transactions t
inner join cte  on cte.customer_id = t.customer_id
group by t.customer_id
order by sum(t.quantity) desc
limit 1;

-- 2. Retrieve the name of the customer who made the most purchases (by quantity).  





