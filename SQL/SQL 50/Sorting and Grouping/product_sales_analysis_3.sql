/*
Table: Sales

+-------------+-------+
| Column Name | Type  |
+-------------+-------+
| sale_id     | int   |
| product_id  | int   |
| year        | int   |
| quantity    | int   |
| price       | int   |
+-------------+-------+
(sale_id, year) is the primary key (combination of columns with unique values) of this table.
product_id is a foreign key (reference column) to Product table.
Each row of this table shows a sale on the product product_id in a certain year.
Note that the price is per unit.
 

Table: Product

+--------------+---------+
| Column Name  | Type    |
+--------------+---------+
| product_id   | int     |
| product_name | varchar |
+--------------+---------+
product_id is the primary key (column with unique values) of this table.
Each row of this table indicates the product name of each product.
 

Write a solution to select the product id, year, quantity, and price for the first year of every product sold.

Return the resulting table in any order.

The result format is in the following example.

 

Example 1:

Input: 
Sales table:
+---------+------------+------+----------+-------+
| sale_id | product_id | year | quantity | price |
+---------+------------+------+----------+-------+ 
| 1       | 100        | 2008 | 10       | 5000  |
| 2       | 100        | 2009 | 12       | 5000  |
| 7       | 200        | 2011 | 15       | 9000  |
+---------+------------+------+----------+-------+
Product table:
+------------+--------------+
| product_id | product_name |
+------------+--------------+
| 100        | Nokia        |
| 200        | Apple        |
| 300        | Samsung      |
+------------+--------------+
Output: 
+------------+------------+----------+-------+
| product_id | first_year | quantity | price |
+------------+------------+----------+-------+ 
| 100        | 2008       | 10       | 5000  |
| 200        | 2011       | 15       | 9000  |
+------------+------------+----------+-------+
*/
-- Code:
WITH CTE AS
(SELECT product_id, min(year) as first_year
FROM Sales
GROUP BY product_id)

SELECT c.product_id, c.first_year, s.quantity, s.price
FROM CTE AS c
JOIN Sales AS s
ON c.product_id = s.product_id
AND c.first_year = s.year

-- ======================================================================

SELECT c.product_id, c.first_year, s.quantity, s.price
FROM (SELECT product_id, min(year) as first_year
FROM Sales
GROUP BY product_id) AS c
JOIN Sales AS s
ON c.product_id = s.product_id
AND c.first_year = s.year
-- Runtime: Tried both versions, all test cases passed but don't know why lc is showing tle
-- ======================================================================
-- FROM LC SOLUTIONS
-- ======================================================================
SELECT s.product_id, s.year as first_year, s.quantity, s.price 
FROM Sales AS s
WHERE s.year IN (SELECT min(year) FROM Sales AS s1 WHERE s.product_id = s1.product_id);


-- Runtime: Even an accepted LC solution is saying tle. !!! 

