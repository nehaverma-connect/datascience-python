-- Print the product categories and subcategories along with the profits made for each order.
select mff.ord_id, mff.prod_id, pd.product_category, pd.product_sub_category, mff.profit
from market_fact_full mff inner join prod_dimen pd
on mff.Prod_id = pd.Prod_id;

-- Find the shipment date, mode and profit made for every single order
select mff.ord_id, sd.ship_mode, sd.ship_date, mff.profit
from market_fact_full mff inner join shipping_dimen sd
on mff.Ship_id = sd.Ship_id;

-- Find the customer details who ordered the highest number of products
select cd.*, cust_max_order.count_products_ordered
from cust_dimen cd inner join (select cust_id, sum(order_quantity) as count_products_ordered
from market_fact_full
group by cust_id
order by count_products_ordered desc
limit 1) cust_max_order
on cd.cust_id = cust_max_order.cust_id;

-- Print the shipment mode, profit made and product category for each product.
select mff.prod_id, pd.product_category, mff.profit, sd.ship_mode
from market_fact_full mff inner join prod_dimen pd
on mff.Prod_id = pd.Prod_id
inner join shipping_dimen sd
on mff.ship_id = sd.ship_id;

-- Selling office supplies was more profitable in Delhi as compared to Bangalore. True or false?
select cust_detail.city, sum(mff.profit) as total_profit
from market_fact_full mff inner join
(select distinct cust_id, city 
from cust_dimen cd
where lower(cd.City) in ('delhi','bangalore')
) cust_detail
on mff.cust_id = cust_detail.cust_id
inner join prod_dimen pd
on pd.Prod_id = mff.Prod_id
where lower(pd.Product_Category) = 'office supplies' 
group by cust_detail.city
order by total_profit desc;

-- Return the order ids which are present in the market facts table.
select mff.Cust_id, mff.Ord_id, od.Order_Date, od.Order_Priority 
from market_fact_full mff
left join orders_dimen od
using (ord_id);

-- Which year generated the highest profit?
select year(od.Order_Date) as order_year, sum(mff.Profit) as year_wise_profit
from market_fact_full mff
inner join orders_dimen od
using (ord_id)
group by order_year
order by year_wise_profit desc
limit 1;

-- Print the three most common products.
