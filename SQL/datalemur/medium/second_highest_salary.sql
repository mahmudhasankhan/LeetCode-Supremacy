
with cte as (SELECT
*,
row_number() OVER(order by salary desc) as rownum
FROM
employee)

select salary from cte where rownum = 2
