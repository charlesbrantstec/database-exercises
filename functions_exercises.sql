use employees;

select *
from employees
where first_name = 'Irena' or first_name = 'Vidya' or first_name = 'Maya'
order by last_name, first_name;

select concat(first_name, ' ', last_name) as 'Employees'
from employees
where last_name like '%E%'
order by emp_no desc;

select concat(first_name, ' ', last_name) as 'Employee', datediff(curdate(), hire_date) as 'Days Since Hire'
from employees
where hire_date like '199%' and birth_date like '%-12-25'
order by hire_date desc, birth_date asc;


