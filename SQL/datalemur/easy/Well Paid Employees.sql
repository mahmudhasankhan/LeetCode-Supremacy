SELECT 
  e1.employee_id,
  e1.name as emp_name
from employee e1
join employee e2
on e1.manager_id = e2.employee_id
where e1.salary > e2.salary
