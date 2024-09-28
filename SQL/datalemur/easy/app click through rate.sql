with data as (SELECT 
  app_id,
  sum(case 
          when event_type = 'impression' then 1 
          else 0 
          end) as count_impression,
  sum(case 
          when event_type = 'click' then 1 
          else 0 
          end) as count_click 
FROM events
where extract(year from timestamp) = '2022'
GROUP BY app_id)

select 
  app_id, 
round(( 100.0 * count_click)/count_impression, 2) as ctr
from data
