/* Write your T-SQL query statement below */
SELECT id, movie, description, rating
FROM Cinema
WHERE id % 2 <> 0 AND description <> 'boring'
ORDER BY rating DESC;

-- 673ms, Beats 41.65%of users with MS SQL Server
