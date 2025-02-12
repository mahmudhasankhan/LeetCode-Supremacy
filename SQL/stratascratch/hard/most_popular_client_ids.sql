
with at_least_fifty_prct as (

select 
    client_id,
    user_id,
   round(( sum(
        case 
            WHEN event_type in ('video call received', 'video call sent', 'voice call received', 'voice call sent')
            ELSE 0
            END 
    ) 
    /
    count(*)::decimal ) * 100, 2) as event_prct
    from fact_events
    group by client_id, user_id

)

select client_id from (
select *, rank() over(order by event_prct desc) as rnk
from at_least_fifty_prct
where event_prct >= 50.0) a
where rnk = 1

-- -- select distinct event_type from fact_events;

-- select * from fact_events where user_id = '3655-SNQYZ'


-- Someone else's solution:
SELECT client_id FROM (SELECT client_id, rank() over (order by count(*) DESC)
FROM fact_events
WHERE user_id in
    (SELECT user_id
     FROM fact_events
     GROUP BY user_id
     HAVING avg(CASE
                    WHEN event_type in ('video call received', 'video call sent', 'voice call received', 'voice call sent') THEN 1
                    ELSE 0
                END) >=0.5)
GROUP BY client_id) a
WHERE rank = 1
