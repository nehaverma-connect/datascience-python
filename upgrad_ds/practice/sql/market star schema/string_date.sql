-- Print the customer names in proper case.
select distinct customer_name, concat(
substring(customer_name,1,1),
lower(substring(substring_index(customer_name," ",1),2,length(substring_index(customer_name," ",1)))),
" ",
substring(substring(customer_name,length(substring_index(customer_name," ",1))+2,length(customer_name)),1,1),
lower(substring(customer_name,length(substring_index(customer_name," ",1))+3,length(customer_name)))
)
from cust_dimen;

-- Print the product names in the following format: Category_Subcategory.
select product_category, product_sub_category, concat(product_category,"_",product_sub_category) as product_name
from prod_dimen;

-- In which month were the most orders shipped?
select month(ship_date) as ship_month, count(ship_id) as max_ship_count
from shipping_dimen
group by ship_month
order by max_ship_count desc
limit 1;


-- Which month and year combination saw the most number of critical orders?
select month(order_date) as order_month, year(order_date) as order_year, count(ord_id) as max_order_count
from orders_dimen
where lower(order_priority) =  'critical'
group by order_month, order_year
order by max_order_count desc
limit 1;


-- Find the most commonly used mode of shipment in 2011.
select ship_mode, count(ship_mode) as ship_mode_count
from shipping_dimen
where year(ship_date) = 2011
group by ship_mode
order by ship_mode_count desc
limit 1;
