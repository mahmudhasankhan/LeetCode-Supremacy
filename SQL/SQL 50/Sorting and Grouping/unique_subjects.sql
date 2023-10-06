/* Write your T-SQL query statement below */
SELECT t1.teacher_id, COUNT(DISTINCT t1.subject_id) AS cnt
FROM Teacher t1
JOIN Teacher t2
ON t1.subject_id = t2.subject_id
AND t1.dept_id = t2.dept_id
GROUP BY t1.teacher_id

-- 3886ms, Beats 22.90%of users with MS SQL Server
