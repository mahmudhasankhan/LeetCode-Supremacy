SELECT activity_date AS day, COUNT(DISTINCT user_id) AS active_users
FROM Activity
WHERE activity_date BETWEEN  DATEADD(DAY, -30, '2019-07-27') AND '2019-07-27'
GROUP BY activity_date

-- Runtime: 1834ms, Beats 78.43%of users with MS SQL Server
