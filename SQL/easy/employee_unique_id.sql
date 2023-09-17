/* Write your T-SQL query statement below */
-- Beats 85.73% users with MS SQL Server
SELECT en.unique_id, e.name
FROM EmployeeUNI as en
RIGHT JOIN Employees as e
ON en.id = e.id;
