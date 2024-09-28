

with target_filled as (select employee_id, sum(deal_size) as filled_target
from deals
GROUP BY employee_id)

SELECT 
        t.employee_id,
        case
          when t.filled_target > s.quota then 'yes'
          else 'no'
          end as made_quota
FROM target_filled t
join sales_quotas s
on t.employee_id = s.employee_id
ORDER BY t.employee_id
