/*
Table: Customer

+---------------+---------+
| Column Name   | Type    |
+---------------+---------+
| customer_id   | int     |
| name          | varchar |
| visited_on    | date    |
| amount        | int     |
+---------------+---------+
In SQL,(customer_id, visited_on) is the primary key for this table.
This table contains data about customer transactions in a restaurant.
visited_on is the date on which the customer with ID (customer_id) has visited the restaurant.
amount is the total paid by a customer.
 

You are the restaurant owner and you want to analyze a possible expansion (there will be at least one customer every day).

Compute the moving average of how much the customer paid in a seven days window 
(i.e., current day + 6 days before). average_amount should be rounded to two decimal places.

Return the result table ordered by visited_on in ascending order.

The result format is in the following example.

 

Example 1:

Input: 
Customer table:
+-------------+--------------+--------------+-------------+
| customer_id | name         | visited_on   | amount      |
+-------------+--------------+--------------+-------------+
| 1           | Jhon         | 2019-01-01   | 100         |
| 2           | Daniel       | 2019-01-02   | 110         |
| 3           | Jade         | 2019-01-03   | 120         |
| 4           | Khaled       | 2019-01-04   | 130         |
| 5           | Winston      | 2019-01-05   | 110         | 
| 6           | Elvis        | 2019-01-06   | 140         | 
| 7           | Anna         | 2019-01-07   | 150         |
| 8           | Maria        | 2019-01-08   | 80          |
| 9           | Jaze         | 2019-01-09   | 110         | 
| 1           | Jhon         | 2019-01-10   | 130         | 
| 3           | Jade         | 2019-01-10   | 150         | 
+-------------+--------------+--------------+-------------+
Output: 
+--------------+--------------+----------------+
| visited_on   | amount       | average_amount |
+--------------+--------------+----------------+
| 2019-01-07   | 860          | 122.86         |
| 2019-01-08   | 840          | 120            |
| 2019-01-09   | 840          | 120            |
| 2019-01-10   | 1000         | 142.86         |
+--------------+--------------+----------------+
Explanation: 
1st moving average from 2019-01-01 to 2019-01-07 has an average_amount of (100 + 110 + 120 + 130 + 110 + 140 + 150)/7 = 122.86
2nd moving average from 2019-01-02 to 2019-01-08 has an average_amount of (110 + 120 + 130 + 110 + 140 + 150 + 80)/7 = 120
3rd moving average from 2019-01-03 to 2019-01-09 has an average_amount of (120 + 130 + 110 + 140 + 150 + 80 + 110)/7 = 120
4th moving average from 2019-01-04 to 2019-01-10 has an average_amount of (130 + 110 + 140 + 150 + 80 + 110 + 130 + 150)/7 = 142.86

*/

/* Write your T-SQL query statement below */


SELECT temp.visited_on, temp.amount, ROUND(temp.average_amount, 2) AS average_amount
FROM (SELECT inner_temp.visited_on,
SUM(CAST(inner_temp.amount AS DECIMAL)) OVER(ORDER BY inner_temp.visited_on ROWS BETWEEN 6 PRECEDING AND CURRENT ROW) AS amount,
AVG(CAST(inner_temp.amount AS DECIMAL)) OVER(ORDER BY inner_temp.visited_on ROWS BETWEEN 6 PRECEDING AND CURRENT ROW ) AS average_amount,
ROW_NUMBER() OVER(ORDER BY inner_temp.visited_on) AS Row#
FROM (
SELECT visited_on, sum(amount) AS amount
FROM Customer
GROUP BY visited_on
) inner_temp
) temp
WHERE temp.Row# >= 7

-- very poor performance, idk probably it is or maybe the server?

------------------------------------------ Best performed query taken from lc -------------------------------

/* Write your T-SQL query statement below */
SELECT visited_on, 
		sum_amount AS amount, 
		ROUND(sum_amount / 7.0, 2) AS average_amount
FROM (SELECT visited_on, 
			SUM(SUM(amount)) OVER(ORDER BY visited_on ROWS BETWEEN 6 PRECEDING AND CURRENT ROW) AS sum_amount,
			DENSE_RANK() OVER(ORDER BY visited_on) AS rank
	FROM Customer
	GROUP BY visited_on) r
WHERE rank >= 7
ORDER BY rank


-------------------------------------------- My version ------------------------------------------------

SELECT r.visited_on, r.amount, ROUND((CAST(r.amount AS DECIMAL) / 7), 2)AS average_amount
FROM (SELECT visited_on, 
			SUM(SUM(amount)) OVER(ORDER BY visited_on ROWS BETWEEN 6 PRECEDING AND CURRENT ROW) AS amount,
			DENSE_RANK() OVER(ORDER BY visited_on) AS rank
	FROM Customer
	GROUP BY visited_on) r
WHERE r.rank >= 7
