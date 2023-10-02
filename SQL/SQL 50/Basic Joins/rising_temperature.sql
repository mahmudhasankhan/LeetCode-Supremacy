/* Write your T-SQL query statement below */

SELECT w1.id as Id 
FROM Weather as w1
JOIN Weather as w2
ON w1.temperature > w2.temperature
WHERE DATEDIFF( DAY, w2.recordDate, w1.recordDate) = 1
