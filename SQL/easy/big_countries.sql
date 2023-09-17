/* Write your T-SQL query statement below */
-- Beats 98.56% of users
SELECT name, population, area
FROM World
WHERE area >= 3000000 OR population >= 25000000;
