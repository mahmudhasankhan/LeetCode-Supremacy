/* Write your T-SQL query statement below */
SELECT a.class as class
FROM Courses as a
GROUP BY a.class
HAVING count(a.class) >= 5

-- Runtime: 1242ms, Beats 72.57%of users with MS SQL Server
