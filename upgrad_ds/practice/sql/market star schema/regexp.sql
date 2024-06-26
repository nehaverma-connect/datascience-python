-- Retrieve the names of all customers that contain the string 'son'
select Customer_Name
from cust_dimen
where customer_name regexp 'son'; 

-- Note REGEXP is case in-sensitive

-- Retrieve the customers that start with A, B, C or D and ending with 'en'
select *
from cust_dimen
where customer_name regexp '^[abcd].*en$';

-- List product sub categories that do not begin with O, C or T
select distinct Product_sub_Category
from prod_dimen
where Product_sub_Category regexp '^[^oct].*';

