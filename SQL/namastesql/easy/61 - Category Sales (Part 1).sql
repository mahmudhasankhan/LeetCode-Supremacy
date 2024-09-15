/*
Write an SQL query to retrieve the total sales amount for each product category in the month of February 2022, only including sales made on weekdays (Monday to Friday). Display the output in ascending order of total sales.

 


Tables: sales
+-------------+-------------+
| COLUMN_NAME | DATA_TYPE   |
+-------------+-------------+
| id          | int         |
| product_id  | int         |
| category    | varchar(12) |
| amount      | int         |
| order_date  | date        |
+-------------+-------------+

*/

-- Solution:

with sales_cte as (
		select product_id, category, amount, datename(WEEKDAY,order_date) as day_of_week,
  		order_date
  		from sales
)

SELECT category, SUM(amount) as total_sales FROM sales_cte
WHERE MONTH(order_date) = 2 and YEAR(order_date) = 2022
and day_of_week not like "Saturday" and day_of_week not like "Sunday" 
group by category
order by SUM(amount) 
