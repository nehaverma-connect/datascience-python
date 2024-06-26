select * from petrescue;

-- calculate the total cost of all animal rescues
select sum(cost) as total_animal_rescue_cost
from petrescue;

-- Find the maximum quantity of animals rescued
select max(quantity) as max_animal_rescued
from petrescue;

-- Calculate the average cost of animals rescued
select avg(cost) as avg_cost
from petrescue;

-- Calculate the average cost of rescuing a dog
select animal, avg(cost/quantity) as avg_cost_rescue
from petrescue
group by animal
having lower(animal) = 'dog';

-- display the rounded cost of each rescue
select id, animal, quantity, round(cost), rescuedate
from petrescue;

-- display the length of each animal name
select animal, length(animal) as animal_name_len
from petrescue;

-- display the animal name in each rescue in uppercase.
select animal, upper(animal) as animal_name_in_upper_case
from petrescue;

-- display the animal name in each rescue in uppercase without duplications
select distinct animal, upper(animal) as animal_name_in_upper_case
from petrescue;

-- display all the columns from the PETRESCUE table, where the animal(s) rescued are cats.
select *
from petrescue
where lower(animal) = 'cat';

-- display the day of the month when cats have been rescued.
select animal, rescuedate, dayofmonth(rescuedate) as dayofmonth_rescue
from petrescue
where lower(animal) = 'cat';

-- display the number of rescues on the 5th month
select sum(quantity) as rescue_in_month_5
from petrescue
where month(rescuedate) = 5;

-- display the number of rescues on the 14th day of the month
select sum(quantity) as rescue_on_day_14
from petrescue
where dayofmonth(rescuedate) = 14;

-- display the third day from each rescue
select pr.*, date_add(rescuedate, interval 3 day) as 3_day_from_rescue
from petrescue pr;

--  display the length of time the animals have been rescued
select pr.*, datediff(current_date, rescuedate) as animal_rescue_length
from petrescue pr;