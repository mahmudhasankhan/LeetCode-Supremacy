/* Write your T-SQL query statement below */

select e.name, b.bonus 
from Employee e
left join Bonus b
on e.empID = b.empID
where b.bonus < 1000 or b.bonus is NULL;

-- 1641ms, Beats 32.91%of users with MS SQL Server
