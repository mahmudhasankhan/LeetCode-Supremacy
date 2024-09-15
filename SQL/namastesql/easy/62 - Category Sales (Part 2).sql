/*
Write an SQL query to retrieve the total sales amount in each category. Include all categories, if no products were sold in a category display as 0. Display the output in ascending order of total_sales.

Tables: sales
+-------------+-----------+
| COLUMN_NAME | DATA_TYPE |
+-------------+-----------+
| amount      | int       |
| category_id | int       |
| sale_date   | date      |
| sale_id     | int       |
+-------------+-----------+
Tables: Categories
+---------------+-------------+
| COLUMN_NAME   | DATA_TYPE   |
+---------------+-------------+
| category_id   | int         |
| category_name | varchar(12) |
+---------------+-------------+
*/

-- Solution

SELECT category_name, sum(total_sales) as total_sales FROM
(SELECT c.category_name, IFNULL(s.amount,0) as total_sales
FROM categories c
LEFT JOIN sales s
ON c.category_id = s.category_id
) a
GROUP BY category_name
ORDER BY sum(total_sales)

