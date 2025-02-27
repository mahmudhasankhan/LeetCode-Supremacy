
with avg_sal_per_dept as 
(
select
  distinct
  e.department_id,
  to_char(s.payment_date, 'MM-YYYY') as payment_date,
  avg(s.amount) over(partition by e.department_id) as avg_salary
from employee e
join salary s on e.employee_id = s.employee_id
where extract( month from s.payment_date) = 3 
and extract(year from s.payment_date) = 2024
order by e.department_id)

,
avg_sal as (
select 
round(avg(s.amount),2) as avg_salary_all
FROM employee e 
JOIN salary s on e.employee_id = s.employee_id 
where extract( month from s.payment_date) = 3 
and extract(year from s.payment_date) = 2024)

select 
  department_id,
  payment_date,
  case 
    when avg_salary > avg_salary_all then 'higher'
    when avg_salary < avg_salary_all then 'lower'
    else 'same'
  end as comparison
from avg_sal_per_dept
cross join avg_sal;

----------------------------------------

-- solution taken from datalemur:

SELECT DISTINCT department_id,
       TO_CHAR(payment_date,'MM-YYYY'),
       CASE WHEN AVG(amount) OVER (PARTITION BY department_id) < AVG(amount) OVER ()
            THEN 'lower'
            WHEN AVG(amount) OVER (PARTITION BY department_id) = AVG(amount) OVER ()
            THEN 'same'
            WHEN AVG(amount) OVER (PARTITION BY department_id) > AVG(amount) OVER ()
            THEN 'higher' END
FROM employee AS emp
INNER JOIN salary AS s
ON emp.employee_id = s.employee_id
WHERE EXTRACT(MONTH FROM payment_date) = 3
      AND EXTRACT(YEAR FROM payment_date) = 2024;
