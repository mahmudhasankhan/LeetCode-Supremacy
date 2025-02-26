

SELECT user_id,
CASE 
WHEN paid is NULL THEN 'CHURN' 
WHEN paid is not NULL AND status in ('NEW','EXISTING','RESURRECT') THEN 'EXISTING'
WHEN paid is not NULL AND status = 'CHURN' THEN 'RESURRECT'
WHEN paid is not NULL AND status is NULL  THEN 'NEW'
end as new_status
FROM advertiser a
FULL OUTER JOIN daily_pay dp using(user_id)
ORDER BY user_id
