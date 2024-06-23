
-- This problem has its real life use cases and it is a very useful and important problem for learning complex sql queries


WITH projects_start_date as (
SELECT start_date,
ROW_NUMBER() OVER(ORDER BY start_date) as row_num
FROM Projects
WHERE start_date NOT IN (SELECT end_date FROM Projects)
),
projects_end_date as (
SELECT end_date,
ROW_NUMBER() OVER(ORDER BY end_date) as row_num
FROM Projects
WHERE end_date NOT IN (SELECT start_date FROM Projects)
)

SELECT start_date, end_date
FROM projects_start_date p1
JOIN projects_end_date p2
ON p1.row_num = p2.row_num
order by datediff(day, start_date, end_date), start_date
