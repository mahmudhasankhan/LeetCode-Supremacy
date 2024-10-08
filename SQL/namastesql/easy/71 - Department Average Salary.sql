/*
You are provided with two tables: Employees and Departments. The Employees table contains information about employees, including their IDs, names, salaries, and department IDs. The Departments table contains information about departments, including their IDs and names. Your task is to write a SQL query to find the average salary of employees in each department, but only include departments that have more than 2 employees . Display department name and average salary round to 2 decimal places. Sort the result by average salary in descending order.

 

Tables: Employees
+---------------+-------------+
| COLUMN_NAME   | DATA_TYPE   |
+---------------+-------------+
| employee_id   | int         |
| employee_name | varchar(20) |
| salary        | int         |
| department_id | int         |
+---------------+-------------+
Tables: Departments
+-----------------+-------------+
| COLUMN_NAME     | DATA_TYPE   |
+-----------------+-------------+
| department_id   | int         |
| department_name | varchar(10) |
+-----------------+-------------+

*/

-- Solution:

SELECT d.department_name, ROUND(AVG(CAST(e.salary AS DECIMAL(10,2))),2) average_salary
FROM employees e
LEFT JOIN departments d
on e.department_id = d.department_id
group by d.department_name
having count(e.salary) > 2
order by d.department_name
