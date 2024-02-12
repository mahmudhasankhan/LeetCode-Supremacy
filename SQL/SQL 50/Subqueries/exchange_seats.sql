/*
Table: Seat

+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| id          | int     |
| student     | varchar |
+-------------+---------+
id is the primary key (unique value) column for this table.
Each row of this table indicates the name and the ID of a student.
id is a continuous increment.
 

Write a solution to swap the seat id of every two consecutive students.
If the number of students is odd, the id of the last student is not swapped.

Return the result table ordered by id in ascending order.

The result format is in the following example.

 

Example 1:

Input: 
Seat table:
+----+---------+
| id | student |
+----+---------+
| 1  | Abbot   |
| 2  | Doris   |
| 3  | Emerson |
| 4  | Green   |
| 5  | Jeames  |
+----+---------+
Output: 
+----+---------+
| id | student |
+----+---------+
| 1  | Doris   |
| 2  | Abbot   |
| 3  | Green   |
| 4  | Emerson |
| 5  | Jeames  |
+----+---------+
Explanation: 
Note that if the number of students is odd, there is no need to change the last one's seat.
*/

/* Write your T-SQL query statement below */
/* Write your T-SQL query statement below */
SELECT
CASE
    WHEN id % 2 != 0 THEN LEAD(id, 1, id) OVER(ORDER BY id)
    ELSE LAG(id) OVER(ORDER BY id)
END AS id,
student
FROM Seat
ORDER BY id


 -- ================================================================== can be done in 2 ways=====================================
SELECT id,
CASE
    WHEN id % 2 != 0 THEN LEAD(student, 1, student) OVER(ORDER BY id)
    ELSE LAG(student) OVER(ORDER BY id)
END AS student
FROM Seat
