
SELECT u.transaction_date, u.user_id, count(product_id) as purchase_count
FROM user_transactions u
JOIN (
SELECT a.transaction_date, a.user_id
FROM (
  SELECT
    transaction_date,
    user_id,
    row_number() over(partition by user_id order by transaction_date desc) as rnk
  FROM user_transactions) a
WHERE a.rnk = 1
) a
on u.user_id = a.user_id and a.transaction_date = u.transaction_date
GROUP BY u.transaction_date, u.user_id;



