/* Write your T-SQL query statement below */
SELECT a.user_id, count(*) as followers_count
FROM Followers AS a
GROUP BY a.user_id

-- Runtime: 1153ms, Beats 89.10%of users with MS SQL Server
