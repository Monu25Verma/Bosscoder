select * from transactions ;

-- DATE  
select transaction_date, curdate(), curtime(), now(), sysdate()
from transactions;

--  exacting portions of your transactions

select transaction_date, year(transaction_date), month(transaction_date), monthname(transaction_date), weekday(transaction_date), dayname(transaction_date)
, hour(transaction_date),  second(transaction_date)
from transactions;

-- DATE_SUB
-- get 30 days from current date for previous month

select transaction_date, date_sub(transaction_date, interval 30 Day) AS pervious_month
, date_sub(transaction_date, interval 30 hour) AS prev_month_3hr
 from transactions;

-- Date add
select transaction_date, date_add(transaction_date, interval 30 Day) AS next_month
, date_add(transaction_date, interval 30 hour) AS prev_month_3hr
 from transactions;

-- calculate diffrence between 2 date

select transaction_date, datediff(curdate(), transaction_date) as date_diff
from transactions;

-- format the date
select transaction_date, 
date_format(transaction_date, '%d\%m\%Y')
AS formatted_date from transactions;

select transaction_date, 
date_format(transaction_date, '%d-%m-%Y')
AS formatted_date from transactions;

select transaction_date, day(transaction_date), monthname(transaction_date),
year(transaction_date),
concat(day(transaction_date), " ", monthname(transaction_date), " ",
year(transaction_date)) AS concatinated
from transactions;

-- str to date
select transaction_date, str_to_date(transaction_date, '%Y-%m-%d') as date_f
from transactions;

-- find transaction from last 30 days 
select transaction_date from transactions
where transaction_date >= curdate() - interval 30 day ;

select transaction_id, transaction_date, 
case when datediff(curdate(), transaction_date) <= 7 then 'Recent (within 7 days)'
when datediff(curdate(), transaction_date) <= 30 then 'Within the last month'
else 'Older than a month' end
AS transaction_age
from transactions;
-- -- 2. Identify transactions based on their age (in days), 
-- if it happened in last 7 days then 
-- label transaction_age as   'Recent (within 7 days)' or 
-- if it is within 30 days then 'Within the last month' or else 'Older than a month' 
 

select transaction_date,  total_amount, dayname(transaction_date),
case 
when dayname(transaction_date) IN('Friday', 'Saturday', 'Sunday') then (total_amount-(total_amount * 0.1))
else total_amount end AS discount_price
from transactions;

-- 3. Apply a discount based on the transaction date, 
-- if transaction happened on Friday or Saturday or Sunday, give 10 % dicsount, 
-- else give 0 discount


 