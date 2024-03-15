
-- Problem: Sales Analysis 3 from leetcode, Difficulty: Easy 

SELECT 
  p.product_id, p.product_name
FROM
  Product p
JOIN 
  Sales s
ON p.product_id = s.product_id
GROUP BY p.product_id, p.product_name
HAVING min(s.sale_date) >= cast('2019-01-01' as Date)
AND max(s.sale_date) <= cast('2019-03-31' as Date)

-- got tle in this :)

-- idk why this got submitted, subquery is faster?

SELECT
product_id, product_name
FROM Product
WHERE product_id IN
(SELECT 
  p.product_id
FROM
  Product p
JOIN 
  Sales s
ON p.product_id = s.product_id
GROUP BY p.product_id
HAVING min(s.sale_date) >= cast('2019-01-01' as Date)
AND max(s.sale_date) <= cast('2019-03-31' as Date)
)
