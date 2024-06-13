use coffe_shop;
CREATE TABLE sales_performance (
    sales_id INT PRIMARY KEY AUTO_INCREMENT,
    sales_rep VARCHAR(100),
    region VARCHAR(50),
    sales_month VARCHAR(20),
    sales_amount DECIMAL(10, 2)
);
INSERT INTO sales_performance (sales_rep, region, sales_month, sales_amount) VALUES
('Alice', 'North', 'January', 1500.00),
('Bob', 'North', 'January', 2000.00),
('Charlie', 'South', 'January', 1200.00),
('Alice', 'South', 'February', 2500.00),
('Bob', 'North', 'February', 1800.00),
('Charlie', 'North', 'February', 2200.00),
('Alice', 'North', 'March', 3000.00),
('Bob', 'North', 'March', 1800.00),
('Charlie', 'South', 'March', 1200.00),
('Alice', 'South', 'April', 2500.00),
('Bob', 'South', 'April', 1800.00),
('Charlie', 'North', 'April', 2200.00),
('Alice', 'North', 'May', 3000.00),
('Bob', 'South', 'May', 1800.00),
('Charlie', 'South', 'May', 1200.00),
('Alice', 'North', 'June', 3000.00),
('Bob', 'North', 'June', 1800.00),
('Charlie', 'South', 'June', 1200.00),
('Alice', 'South', 'July', 2500.00),
('Bob', 'North', 'July', 1800.00),
('Charlie', 'North', 'July', 2200.00),
('Alice', 'South', 'August', 3000.00),
('Bob', 'South', 'August', 1800.00),
('Charlie', 'North', 'August', 1200.00),
('Alice', 'North', 'September', 3000.00),
('Bob', 'South', 'September', 1800.00),
('Charlie', 'North', 'September', 1200.00),
('Alice', 'North', 'October', 3000.00),
('Bob', 'North', 'October', 1800.00),
('Charlie', 'North', 'October', 2200.00);

select * from sales;
select * from sales_performance;

select *, row_number() over(partition by region 
order by sales_amount desc) as row_num
from sales;

select *, row_number() over(partition by region
order by sales_amount)AS row_num
from sales;

select *, 
row_number() over(partition by region order by sales_amount desc)AS row_num,
rank() over(partition by region order by sales_amount desc)AS row_num
from sales;
-- rank funtion 

select *, 
row_number() over(partition by region order by sales_amount desc)AS row_num,
rank() over(partition by region order by sales_amount desc)AS row_num,
dense_rank() over(partition by region order by sales_amount desc)AS row_num
from sales;
-- comapere row_number, ran, dense_rank 

select * from(
select *, rank() over(partition by region, sales_month) as rnk
from sales_performance
)rnk_region;

select * from(
select sales_rep, region, sales_amount, sales_month, 
rank() over (partition by sales_month, region order by sales_amount desc, sales_amount) as rnk
from sales_performance
) as x
where x.rnk = 1;

-- 2.Rank sales representatives across all regions for each month based on their sales,
--  allowing for ties but showing no gaps in the ranking 

select *, 
sum(sales_amount) over(partition by sales_rep order by sales_month) as cumulative_sales
from sales_performance;
-- 3. Calculate the cumulative sales for each sales representative over all months
-- cumilative sales means doing the sum of our number with next number -> eg: 50, 100, 130 --> 50 + 100 -> 150 + 130 -> 280

SELECT 
    sales_rep, 
    sales_month, 
    sales_amount
FROM (
    SELECT 
        sales_rep, 
        sales_month, 
        sales_amount,
        RANK() OVER (PARTITION BY sales_rep ORDER BY sales_amount DESC) AS sales_rank
    FROM sales_performance
) ranked_sales
WHERE sales_rank = 1;

-- Determine the best sales month for each sales representative

-- HOMEWORK
select * from(
	select sum(sales_amount) AS total_sales,
    dense_rank() over(PARTITION by region, sales_rep order by sum(sales_amount) desc) AS rnk_sales
    from sales_performance
    group by sales_rep, region;
-- 1. Rank sales representatives by their total sales in each region, handling ties without gaps in ranking

select *, 
rank() over(partition by region, sales_month order by sales_amount desc) AS rnk_month
from sales_performance
where sales_amount = 1
-- 2. List the sales representatives who led the sales in each region for each month, without skipping months 





