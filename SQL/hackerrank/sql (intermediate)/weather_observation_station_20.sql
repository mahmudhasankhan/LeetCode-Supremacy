DECLARE @max_row decimal;

set @max_row = (select count(*) from station)

select cast(s.lat_n as decimal(10,4))
from (select lat_n,
dense_rank() over( order by lat_n) as rnk
from station) s
where s.rnk = round(@max_row / 2, 0)

-- it was a pretty nice problem, took a bit of help but only theoretically
-- also by solving this problem, i have solved all the aggregation problems.
