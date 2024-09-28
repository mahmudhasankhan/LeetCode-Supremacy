with cte as (SELECT d.department_name, e.name, e.salary, 
dense_rank() OVER(PARTITION BY d.department_name ORDER BY d.department_name, e.salary DESC) as salary_rank
FROM employee e
JOIN department d
ON e.department_id = d.department_id)

SELECT department_name, name, salary from cte 
WHERE salary_rank <= 3
