-- Problem: Placements from Hackerrank, Difficulty: Medium

with cte1 as (
select s.id, s.name, p.salary
from Students s
join Packages p
on s.id = p.id)
,
cte2 as (
select f.id, f.friend_id as friend, p.salary as salary
from friends f
join Packages p
on f.friend_id = p.id
)

select c1.name
from cte1 as c1
join cte2 as c2
on c1.id = c2.id
where c1.salary < c2.salary
order by c2.salary;
