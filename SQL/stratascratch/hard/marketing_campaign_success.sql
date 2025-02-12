
with rank_data as (

select 
    *,
    rank() over(partition by user_id order by created_at) as rnk
from marketing_campaign
)
, first_app_purchase as (
 select * from rank_data where rnk = 1
)
, except_first_app_purchase as (
select * from rank_data where rnk > 1
)


select 
count(distinct ep.user_id)
from except_first_app_purchase ep
left join first_app_purchase fp
on ep.user_id = fp.user_id and ep.product_id = fp.product_id
where fp.product_id is null

-- it was a difficult problem to solve
