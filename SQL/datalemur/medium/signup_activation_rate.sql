with cte as (
select 
e.user_id, e.email_id, t.text_id, t.signup_action,
row_number() over(partition by e.user_id, e.email_id order by t.text_id desc) rnk
from emails e 
left join texts t on e.email_id = t.email_id
-- order by e.user_id, e.email_id
)

select round(sum(case when signup_action = 'Confirmed' then 1 else 0 end) / count(*)::decimal(10,2),2)
from cte 
where 1=1
and rnk = 1;
