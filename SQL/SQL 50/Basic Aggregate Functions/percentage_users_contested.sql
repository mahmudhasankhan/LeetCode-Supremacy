
WITH Register_CTE(contest_id, UserRegCount)
AS
-- Define Cross JOIN between Student and Subject tables
(
  SELECT contest_id, CAST(COUNT(user_id) AS DECIMAL(10,2)) AS UserRegCount 
  FROM Register 
    GROUP BY contest_id
)

,  -- Use a comma to separate multiple CTE definitions.

-- Define the second CTE query,
User_CTE(user_count)
AS
(
  SELECT CAST(COUNT(user_id) AS DECIMAL(10,2)) AS user_count
  FROM users
)

-- Define the outer query by referencing columns from both CTEs
SELECT contest_id, ROUND((Register_CTE.UserRegCount / User_CTE.user_count) * 100, 2) AS percentage
FROM Register_CTE
CROSS JOIN User_CTE
  ORDER BY percentage DESC, contest_id ASC;

-- 4744ms, Beats 99.69% of users with MS SQL Server
-- Did this all by myself!!!!!!!!!, ZERO HELP taken

-------- 
--------

-- A different way to do this, more simple way infact, without using common table expressions

SELECT contest_id, 
ROUND(CAST(COUNT(user_id) AS FLOAT)/ CAST((SELECT COUNT(user_id) FROM users) AS FLOAT) * 100 , 2) 
AS percentage
FROM Register
  GROUP BY contest_id
  ORDER BY percentage DESC, contest_id ASC;
