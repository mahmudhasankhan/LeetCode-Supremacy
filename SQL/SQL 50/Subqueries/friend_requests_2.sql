/*

Table: RequestAccepted

+----------------+---------+
| Column Name    | Type    |
+----------------+---------+
| requester_id   | int     |
| accepter_id    | int     |
| accept_date    | date    |
+----------------+---------+
(requester_id, accepter_id) is the primary key (combination of columns with unique values) for this table.
This table contains the ID of the user who sent the request, the ID of the user who received the request, 
and the date when the request was accepted.
 

Write a solution to find the people who have the most friends and the most friends number.

The test cases are generated so that only one person has the most friends.

The result format is in the following example.

 

Example 1:

Input: 
RequestAccepted table:
+--------------+-------------+-------------+
| requester_id | accepter_id | accept_date |
+--------------+-------------+-------------+
| 1            | 2           | 2016/06/03  |
| 1            | 3           | 2016/06/08  |
| 2            | 3           | 2016/06/08  |
| 3            | 4           | 2016/06/09  |
+--------------+-------------+-------------+
Output: 
+----+-----+
| id | num |
+----+-----+
| 3  | 3   |
+----+-----+
Explanation: 
The person with id 3 is a friend of people 1, 2, and 4, so he has three friends in total,
which is the most number than any others.
 
Follow up: In the real world, multiple people could have the same most number of friends.
Could you find all these people in this case?

*/

-- Solution:

SELECT r.requester_id, r.requester_cnt, a.accepter_id,  a.accepter_cnt
FROM
(SELECT requester_id, COUNT(accepter_id) requester_cnt
FROM RequestAccepted 
GROUP BY requester_id) r
,
(SELECT accepter_id, COUNT(requester_id) accepter_cnt
FROM RequestAccepted 
GROUP BY  accepter_id) a
WHERE r.requester_id = a.accepter_id
ORDER BY r.requester_cnt + a.accepter_cnt DESC

--------------------------- 10/12 test cases passed for this above code -------------------------------


SELECT TOP 1 p.id, SUM(p.num) AS num
FROM 
(
SELECT *
FROM
(SELECT requester_id AS id, COUNT(accepter_id) AS num
FROM RequestAccepted 
GROUP BY requester_id) a
UNION ALL
SELECT *
FROM (SELECT accepter_id AS id, COUNT(requester_id) AS num
FROM RequestAccepted 
GROUP BY accepter_id) a
) p
GROUP BY p.id
ORDER BY SUM(p.num) DESC

------------------------------Passed :D ----------------------------
