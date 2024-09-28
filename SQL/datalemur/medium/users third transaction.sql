select user_id, spend, transaction_date FROM(SELECT *,
row_number() over(PARTITION BY user_id order by transaction_date) as rows
FROM transactions) a
where a.rows = 3
