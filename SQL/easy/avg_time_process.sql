/* Write your T-SQL query statement below */
select a.machine_id,
cast(sum(b.timestamp - a.timestamp) / count( distinct a.process_id) AS DECIMAL(5, 3)) AS processing_time
from activity as a
join activity as b
on a.machine_id = b.machine_id
and a.process_id = b.process_id
where a.activity_type = 'start' and b.activity_type = 'end'
group by a.machine_id

-- 496ms speed, beats 85.03% of users with MS SQL Server
