
with products as (SELECT 
  category,
  product,
  SUM(spend) as total_spend,
  dense_rank() OVER(PARTITION BY category ORDER BY SUM(spend) DESC) as spend_rank
FROM product_spend
WHERE EXTRACT(year from transaction_date) = '2022'
GROUP BY category, product)

SELECT category, product, total_spend FROM products where spend_rank <= 2
