/*
You are given a table Employees that contains information about employees in a company. Each employee might have been mentored by another employee. Your task is to find the names of all employees who were not mentored by the employee with id = 3.

 

Table: employees 
+-------------+-------------+
| COLUMN_NAME | DATA_TYPE   |
+-------------+-------------+
| id          | int         |    
| name        | varchar(10) |
| mentor_id   | int         |
+-------------+-------------+
*/

-- Solution:

select name from employees
where id not in (

select 
	e1.id as employee_id
from employees e1
left join employees e2
on e2.id = e1.mentor_id
where e1.mentor_id = 3 )
