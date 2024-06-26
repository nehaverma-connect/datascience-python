-- Print the entire data of all customers
select * 
from cust_dimen; 

-- List the names of all customers
select customer_name 
from cust_dimen;

-- Print the name of all customers along with city and state
select customer_name, city, state 
from cust_dimen;

-- Print total number of customers
select count(*) as total_customer 
from cust_dimen;

-- How many customer are from West Bengal
select count(*) as cust_count_bengal 
from cust_dimen 
where state = 'West Bengal';

-- Print the names of all customers who belong to West Bengal
select customer_name as customer_from_bengal 
from cust_dimen 
where state = 'West Bengal';

-- Operators

-- Print the names of all customers who are either corporate or belong to Mumbai.
select customer_name, city, customer_segment 
from cust_dimen 
where city = 'Mumbai' or customer_segment = 'CORPORATE';


-- Print the names of all corporate customers from Mumbai.
select customer_name, city, customer_segment 
from cust_dimen 
where city = 'Mumbai' and customer_segment = 'CORPORATE';


-- List the details of all the customers from southern India: namely Tamil Nadu, Karnataka, Telangana and Kerala.
select * 
from cust_dimen
where state in ('Tamil Nadu','Karnataka','Telangana','Kerala');

-- Print the details of all non-small-business customers.
select * 
from cust_dimen 
where customer_segment != 'SMALL BUSINESS';

-- List the order ids of all those orders which caused losses.
select ord_id 
from market_fact_full 
where profit < 0;

-- List the orders with '_5' in their order ids and shipping costs between 10 and 15.
select ord_id, shipping_cost 
from market_fact_full 
where ord_id like '%\_5%' and shipping_cost between 10 and 15;

