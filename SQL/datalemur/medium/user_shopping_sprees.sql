

-- My solution works
with final_cte as (
SELECT 
*, 
  extract(day from transaction_date - coalesce(previous_date, transaction_date)) as days_elapsed_till_current_transaction_date,
  extract(day from following_date - coalesce(transaction_date, transaction_date)) as days_elapsed_after_current_trascation_date
  
  FROM (
SELECT *,
lag(transaction_date) over(partition by user_id order by user_id) as previous_date,
lead(transaction_date) over(partition by user_id order by user_id) as following_date
FROM transactions
order by user_id, transaction_date
) a
-- where transaction_count >= 3
order by user_id
)

  select user_id 
  from final_cte 
  where 
    days_elapsed_till_current_transaction_date = 1
    and days_elapsed_after_current_trascation_date = 1;

-- Solution given in datalemur

SELECT distinct T1.user_id
FROM transactions AS T1
INNER JOIN transactions AS T2
ON DATE(T2.TRANSACTION_DATE) = DATE(T1.TRANSACTION_DATE) + 1
INNER JOIN transactions AS T3
ON DATE(T3.TRANSACTION_DATE) = DATE(T1.TRANSACTION_DATE) + 2
ORDER BY user_id;

-- this version of solution is much more precise and more readable!
