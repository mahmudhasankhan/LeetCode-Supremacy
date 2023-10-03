/* Write your T-SQL query statement below */

WITH StudentSubject_CTE (student_id, student_name, subject_name) 
AS 
-- Define Cross JOIN between Student and Subject tables
(
  SELECT s.student_id, s.student_name, sb.subject_name
  FROM Students as s 
  CROSS JOIN Subjects as sb
)

,  -- Use a comma to separate multiple CTE definitions.

-- Define the second CTE query,
Exams_CTE (student_id, subject_name, exams_taken)
AS
(
  SELECT student_id, subject_name, count(subject_name) as exams_taken
  FROM examinations
    GROUP BY student_id, subject_name
)

-- Define the outer query by referencing columns from both CTEs
SELECT StudentSubject_CTE.student_id
  , StudentSubject_CTE.student_name
  , StudentSubject_CTE.subject_name
  , ISNULL(Exams_CTE.exams_taken, 0) as attended_exams
FROM StudentSubject_CTE  
LEFT JOIN Exams_CTE ON StudentSubject_CTE.student_id = Exams_CTE.student_id
AND StudentSubject_CTE.subject_name = Exams_CTE.subject_name
  ORDER BY StudentSubject_CTE.student_id, StudentSubject_CTE.student_name,StudentSubject_CTE.subject_name


-- 998ms, Beats 42.21%of users with MS SQL Server
