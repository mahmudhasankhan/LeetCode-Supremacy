
WITH Register_CTE(contest_id, UserRegCount)
AS
(
  SELECT contest_id, CAST(COUNT(user_id) AS DECIMAL(10,2)) AS UserRegCount 
  FROM Register 
    GROUP BY contest_id
)
,
User_CTE(user_count)
AS
(
  SELECT CAST(COUNT(user_id) AS DECIMAL(10,2)) AS user_count
  FROM users
)

SELECT contest_id, ROUND((Register_CTE.UserRegCount / User_CTE.user_count) * 100, 2) AS percentage
FROM Register_CTE
CROSS JOIN User_CTE
ORDER BY percentage DESC, contest_id ASC;

-- 4744ms, Beats 99.69% of users with MS SQL Server
-- Did this all by myself!!!!!!!!!, ZERO HELP taken

-------- 
--------

-- A different way to do this, more simple way infact, without using common table expressions

select contest_id, 
round(cast(count(user_id) as float)/ cast((select count(user_id) from users) as float) * 100 , 2) 
as percentage from Register
group by contest_id
order by percentage desc, contest_id asc;
