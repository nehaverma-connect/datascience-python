-- Combine the order numbers for orders and order ids for all shipments in a single column.
select order_number 
from orders_dimen
union
select Order_Number
from shipping_dimen;

-- What are the two most and the two least profitable products?
(select prod_id, sum(profit) as prod_profit, 'MAX Profit' as profit_type
from market_fact_full
group by Prod_id
order by prod_profit desc
limit 2)
union
(select prod_id, sum(profit) as prod_profit, 'MIN Profit' as profit_type
from market_fact_full
group by Prod_id
order by prod_profit
limit 2)
