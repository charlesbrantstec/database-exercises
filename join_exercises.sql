use join_test_db;

INSERT INTO users (name, email, role_id) VALUES
('chuck', 'chuck@example.com', 2),
('charlie', 'charlie@example.com', 2),
('chaz', 'chaz@example.com', 2),
('chump', 'chump@example.com', null);

# Use join, left join, and right join to combine results from the
# users and roles tables as we did in the lesson.
# Before you run each query, guess the expected number of results.

SELECT users.name as user_name, roles.name as role_name
FROM users
JOIN roles ON users.role_id = roles.id;

SELECT users.name AS user_name, roles.name AS role_name
FROM users
LEFT JOIN roles ON users.role_id = roles.id;

SELECT users.name AS user_name, roles.name AS role_name
FROM users
RIGHT JOIN roles ON users.role_id = roles.id;

Select roles.name AS role_name, COUNT(*)
From users
join roles ON users.role_id = roles.id
GROUP BY roles.name;

#######################################################################################################

USE employees;

select d.dept_name as `Department Name`, CONCAT(e.first_name, ' ', e.last_name) AS `Department Manager Name`
FROM employees as e
    join dept_manager as dm
        on dm.emp_no = e.emp_no
    join departments as d
        on d.dept_no = dm.dept_no
where dm.to_date = '9999-01-01' and e.gender = 'F'
order by d.dept_name;

select t.title as `Title`, count(*) as `Count`
from titles as t
    join employees as e
        on t.emp_no = e.emp_no
    join dept_emp as de
        on de.emp_no = e.emp_no
    join departments as d
        on d.dept_no = de.dept_no
where de.to_date like '9999%' and d.dept_name = 'Customer Service' and t.to_date like '9999%'
group by t.title
order by t.title;

select d.dept_name as `Department Name`, CONCAT(e.first_name, ' ', e.last_name) AS `Department Manager Name`, s.salary as `Salary`
FROM employees as e
         join salaries as s
              on s.emp_no = e.emp_no
         join dept_manager as dm
              on dm.emp_no = dm.dept_no
        join departments as d
              on d.dept_no = dm.dept_no
where dm.to_date = '9999-01-01' and s.to_date = '9999-01-01'
order by d.dept_name;


