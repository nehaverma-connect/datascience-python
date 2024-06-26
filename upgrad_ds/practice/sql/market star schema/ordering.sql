/*
	We will be covering ordering in SQL 
*/
     
--  List the customer names in alphabetical order.
select distinct customer_name 
from cust_dimen 
order by customer_name;


-- Print the three most ordered products.
select prod_id, sum(order_quantity) as prod_order_quantity 
from market_fact_full 
group by prod_id 
order by prod_order_quantity 
desc limit 3;

--  Print the three least ordered products.
select prod_id, sum(order_quantity) as prod_order_quantity 
from market_fact_full 
group by prod_id 
order by prod_order_quantity 
limit 3;

--  Arrange the order ids in the order of their recency.
select * 
from orders_dimen 
order by order_date desc;

--  Arrange all consumers from Coimbatore in alphabetical order.
select * 
from cust_dimen 
where city = 'Coimbatore' and customer_segment = 'Consumer' 
order by Customer_Name;