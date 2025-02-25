
with cte as (
SELECT *, rank() over(partition by user_id order by month desc) as rnk
FROM (
SELECT distinct user_id, extract(month from event_date) as month FROM user_actions
where user_id in (
SELECT user_id
FROM user_actions
GROUP BY user_id
having count(distinct event_type) = 3)
) a )


select curr_month as mth, count(user_id) as monthly_active_users
from (
select a.user_id,a.month as curr_month, b.month as prev_month , a.month - b.month as month_diff FROM
cte a
join cte b on a.user_id = b.user_id
where a.rnk = 1 and b.rnk = 2
) B
where month_diff = 1
group by curr_month

-- 

-- Solution from discussion thread

SELECT EXTRACT(MONTH FROM event_date) AS MONTH, count(DISTINCT user_id) AS Monthly_Active_Users
FROM user_actions
WHERE event_date BETWEEN '07/01/2022' AND '07/31/2022'
AND user_id IN 
(
SELECT user_id
FROM user_actions
WHERE event_date BETWEEN '06/01/2022' AND '06/30/2022'
)
GROUP BY MONTH



