/* Write your T-SQL query statement below */
SELECT P.project_id, ROUND(CAST(SUM(E.experience_years) AS DECIMAL(10,2)) / CAST(COUNT(E.experience_years) AS DECIMAL(10,2)),2) AS average_years
FROM Project AS P
JOIN Employee AS E
ON P.employee_id = E.employee_id
GROUP BY P.project_id

-- 3374ms, Beats 85.71%of users with MS SQL Server
