
with cte as (SELECT measurement_time::date as measurement_day, measurement_value, measurement_time::TIMESTAMP::time as Time
FROM measurements)
,
cte1 as (
select 
    measurement_day,
    measurement_value,
  row_number() over(PARTITION BY measurement_day order by Time) as row_num
from cte )


select measurement_day, sum(case when mod(row_num, 2) <> 0 then measurement_value else 0 end) as odd_sum,
sum(case when mod(row_num, 2) = 0 then measurement_value else 0 end) as even_sum
from cte1
group by measurement_day;


-- learning outcome from this:
-- learned to cast time and date from timestamp DATA
-- learned to mod in pgsql

-- Time: 18:30 (took too long)
