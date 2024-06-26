-- 1. Create a view to display the sales amounts, the number of orders, profits made and the shipping costs of all
-- orders. Query it to return all orders which have a profit of greater than 1000.

create view order_info as
select ord_id, sales, Order_Quantity, profit, shipping_cost
from market_fact_full;

select *
from order_info
where profit > 1000; 
