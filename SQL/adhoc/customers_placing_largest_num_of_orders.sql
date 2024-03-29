/*
Table: Orders

+-----------------+----------+
| Column Name     | Type     |
+-----------------+----------+
| order_number    | int      |
| customer_number | int      |
+-----------------+----------+
order_number is the primary key (column with unique values) for this table.
This table contains information about the order ID and the customer ID.
 

Write a solution to find the customer_number for the customer who has placed the largest number of orders.

The test cases are generated so that exactly one customer will have placed more orders than any other customer.

The result format is in the following example.

 

Example 1:

Input: 
Orders table:
+--------------+-----------------+
| order_number | customer_number |
+--------------+-----------------+
| 1            | 1               |
| 2            | 2               |
| 3            | 3               |
| 4            | 3               |
+--------------+-----------------+
Output: 
+-----------------+
| customer_number |
+-----------------+
| 3               |
+-----------------+
Explanation: 
The customer with number 3 has two orders, which is greater than either customer 1 or 2 because each of them only has one order. 
So the result is customer_number 3.
 

Follow up: What if more than one customer has the largest number of orders, can you find all the customer_number in this case?

*/

-- Solution:

SELECT l.customer_number
FROM (SELECT customer_number,
DENSE_RANK() OVER(ORDER BY r.cnt DESC) AS rnk
FROM (SELECT customer_number, COUNT(order_number) as cnt
FROM Orders 
GROUP BY customer_number) r ) l
WHERE l.rnk = 1

-- I feel like i thought too critical during solving this problem, my solution is by no means simple to the avg joe

These are more simpler solutions than mine
-----------------------
select top 1 customer_number
from (
    select customer_number,
    rank() over (partition by customer_number order by order_number) as rank
    from orders
)o
order by rank desc

-----------------------

-----------------------
select distinct customer_number
from orders
where customer_number in
(select top(1) customer_number
from orders
group by customer_number
order by count(order_number) desc)

-------------------- My revised solution after seeing the above solution ----------------------
select top (1) customer_number
from orders
group by customer_number
order by count(order_number) desc

-- Remarks: I think this one is much more simpler to read and understand
