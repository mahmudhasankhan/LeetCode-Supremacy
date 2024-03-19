/* Given three tables, representing customer transactions and customer attributes:

Write a query to get the average order value by gender.

Note: We're looking at the average order value by users that have ever placed an order.

Additionally, please round your answer to 2 decimal places.


transactions table:
+----------------+----------+
| Column Name    | Type     |
+----------------+----------+
| id             | int      |
| user_id        | int      |
| created_at     | datetime |
| product_id     | int      |
| quatity        | int      |
+----------------+----------+

users table
+----------------+----------+
| Column Name    | Type     |
+----------------+----------+
| id             | int      |
| name           | varchar  |
| sex            | varchar  |
+----------------+----------+

products table
+----------------+----------+
| Column Name    | Type     |
+----------------+----------+
| id             | int      |
| name           | varchar  |
| price          | float    |
+----------------+----------+

Output table:

+----------------+----------+
| Column Name    | Type     |
+----------------+----------+
| sex            | int      |
| aov            | float    |
+----------------+----------+

*/

-- Solution:
select u.name as name, ROUND(SUM(p.price)/SUM(t.quantity) , 2) as aov -- idk feels a bit fishy about the formula but my joins are correct
FROM users u 
JOIN transactions t 
ON u.id = t.user_id
JOIN products p 
ON p.id = t.product_id
GROUP BY u.name
-- or 
select u.name as name, ROUND(AVG(p.price * t.quantity) , 2) as aov
FROM users u 
JOIN transactions t 
ON u.id = t.user_id
JOIN products p 
ON p.id = t.product_id
GROUP BY u.name
