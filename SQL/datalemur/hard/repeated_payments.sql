with cte as (
SELECT 
    a.merchant_id,
    a.credit_card_id as initial_card_used,
    a.transaction_timestamp as initial_time_of_purchase,
    b.credit_card_id as current_card_used,
    b.transaction_timestamp as current_time_of_purchase,
    extract(MINUTE from b.transaction_timestamp - a.transaction_timestamp) as time_elapsed
FROM transactions a
join transactions b on a.transaction_id + 1 = b.transaction_id 
and a.merchant_id = b.merchant_id
where a.credit_card_id = b.credit_card_id)

select  count(*) - 1 as payment_count
from cte where time_elapsed <= 10
-- select * from transactions
