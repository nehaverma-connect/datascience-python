-- Retrieve all employees whose address is in Elgin,IL.
select * 
from employees 
where address like '%Elgin,IL%';

-- Retrieve all employees who were born during the 1970’s.
select *
from employees
where year(b_date) between 1970 and 1979;

-- Retrieve all employees in department 5 whose salary is between 60000 and 70000.
select *
from employees
where dep_id = 5 and (salary between 60000 and 70000);

-- Retrieve a list of employees ordered by department ID.
select *
from employees
order by dep_id;

-- Retrieve a list of employees ordered in descending order by department ID
-- and within each department ordered alphabetically in descending order by last name.
select *
from employees
order by dep_id desc, l_name desc;

-- For each department ID retrieve the number of employees in the department.
select dep_id, count(*) as dep_emp_count
from employees
group by dep_id;

-- For each department retrieve the number of employees in the department, and the average employee salary in the department.
select dep_id, count(*) as dep_emp_count, avg(salary) as dep_avg_salary
from employees
group by dep_id;

-- In the above query, order the result set by Average Salary
select dep_id, count(*) as dep_emp_count, avg(salary) as dep_avg_salary
from employees
group by dep_id
order by dep_avg_salary;

-- In the above query, limit the result to departments with fewer than 4 employees.
select dep_id, count(*) as dep_emp_count, avg(salary) as dep_avg_salary
from employees
group by dep_id
having dep_emp_count < 4
order by dep_avg_salary;

-- retrieve all employee records whose salary is lower than the average salary
select *
from employees
where salary < (select avg(salary) from employees);

-- retrieve all employee records with EMP_ID, SALARY, and maximum salary as MAX_SALARY 
select emp_id, salary, (select max(salary) from employees) as max_salary
from employees;

-- retrieve the first and last names of the oldest employee
select f_name, l_name
from employees
where b_date = (select min(b_date) from employees);

-- extract the average salary of the top 5 earners in the company
select avg(salary) from (select salary
from employees
order by salary desc
limit 5) as salary_top_five;

-- find the average salary of the five least-earning employees
select avg(salary) from (select salary
from employees
order by salary
limit 5) as salary_least_five;

-- find the records of employees older than the average age of all employees.
select *
from employees
where (current_date-b_date) > (select avg((current_date-b_date)) from employees);

-- Retrieve only the EMPLOYEES records corresponding to jobs in the JOBS table
select *
from employees
where job_id in (select job_ident 
				 from jobs);

select employees.*
from employees, jobs
where employees.job_id = jobs.job_ident;

-- Retrieve JOB information for employees earning over $70,000

select *
from jobs
where job_ident in (select job_id 
					from employees
                    where salary > 70000);
                    
-- Retrieve only the list of employees whose JOB_TITLE is Jr. Designer
select e.*
from employees e, jobs j
where e.job_id = j.job_ident
and j.job_title = 'Jr. Designer';

-- Retrieve JOB information and a list of employees whose birth year is after 1976
select e.*, j.job_title, j.min_salary, j.max_salary
from employees e, jobs j
where e.job_id = j.job_ident
and year(e.b_date) > 1976;