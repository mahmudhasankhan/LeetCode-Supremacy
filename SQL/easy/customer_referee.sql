/* Write your T-SQL query statement below */
-- this beats 81.94% of users with MS SQL Server
SELECT name 
FROM Customer
WHERE referee_id IS NULL OR referee_id <> 2;

