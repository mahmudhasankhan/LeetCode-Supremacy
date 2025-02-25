WITH CTE AS (
SELECT *, lag(spend) OVER(PARTITION BY product_id ORDER BY product_id, year) as prev_year_spend
FROM (
SELECT 
extract(year from transaction_date) as year,
product_id,
sum(spend) as spend
FROM user_transactions
GROUP by extract(year from transaction_date), product_id
ORDER BY product_id, year) A
)

SELECT *, ROUND(((spend/prev_year_spend)-1)*100,2) AS yoy_rate
from CTE

-- nice problem, good usecase example for lag function
