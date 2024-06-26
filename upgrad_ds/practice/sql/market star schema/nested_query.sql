-- 1. Print the order number of the most valuable order by sales.
select ord_id, round(sales) as rounded_sales
from market_fact_full
where sales  = (select max(sales) from market_fact_full);


-- 2. Print the name of the most frequent customer.
select cust_id, customer_name 
from cust_dimen
where cust_id = (select Cust_id
				from market_fact_full
                group by cust_id
                order by count(cust_id) desc
                limit 1);

-- 3. Print the three most common products.
select prod_id, Product_Category, Product_Sub_Category
from prod_dimen
where prod_id in (select Prod_id
                  from market_fact_full
                  group by Prod_id
                  order by count(prod_id) desc
				 )
limit 3;