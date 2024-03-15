-- Problem: Department Top Three Salaries  from leetcode, Difficulty: Easy 

SELECT
  r.Department, r.Employee, r.Salary
FROM 
  (SELECT 
     d.name as Department, 
     e.name as Employee, 
     e.salary as Salary,
     DENSE_RANK() OVER(PARTITION BY d.name ORDER BY e.Salary DESC) Rnk
   FROM 
     Employee e
   JOIN
     Department d
   ON e.departmentId = d.id) r
WHERE r.Rnk <= 3


"""
Hardest part of window functions is the syntax

1. Start with Partition BY | Order BY first
2. Define your window function next (RANK, ROW, DENSE_RANK)
3. If we want TOP X, usually ORDER BY is needed
"""
