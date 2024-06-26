-- Aggregate Functions

-- 1. Find the total number of sales made.
select count(sales) as number_of_sales 
from market_fact_full;

-- 2. What are the total numbers of customers from each city?
select city, count(customer_name) as number_of_cust 
from cust_dimen 
group by city;

-- 3. Find the number of orders which have been sold at a loss.
select count(ord_id) as num_order_loss 
from market_fact_full 
where profit < 0;

-- 4. Find the total number of customers from Bihar in each segment.
select distinct state 
from cust_dimen;

select customer_segment, count(customer_name) as num_of_customer 
from cust_dimen 
where state = 'Bihar' 
group by customer_segment;


-- 5. Find the customers who incurred a shipping cost of more than 50.
select cust_id, sum(Shipping_Cost) as cust_shipping_cost 
from market_fact_full 
group by cust_id 
having cust_shipping_cost > 50
