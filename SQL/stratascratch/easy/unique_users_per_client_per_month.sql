select
	client_id, extract(month from time_id) as month, count(distinct user_id) as users_num
from fact_events
group by client_id, extract(month from time_id)


-- select * from fact_events
