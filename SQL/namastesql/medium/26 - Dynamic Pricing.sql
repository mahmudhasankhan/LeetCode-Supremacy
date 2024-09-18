/*
You are given a products table where a new row is inserted every time the price of a product changes.
Additionally, there is a transaction table containing details such as order_date and product_id for each order.

Write an SQL query to calculate the total sales value for each product,
considering the cost of the product at the time of the order date, display the output in ascending order of the product_id.

 

Table: products
+-------------+-----------+
| COLUMN_NAME | DATA_TYPE |
+-------------+-----------+
| product_id  | int       |
| price       | int       |
| price_date  | date      |
+-------------+-----------+
Table: orders 
+-------------+-----------+
| COLUMN_NAME | DATA_TYPE |
+-------------+-----------+
| order_id    | int       |
| order_date  | date      |
| product_id  | int       |
+-------------+-----------+
*/

-- Solution:
with cte as (select p.product_id, o.order_date, max(p.price) as price 
from products p
join orders o
on p.product_id = o.product_id
where p.price_date <= o.order_date 
group by p.product_id, o.order_date)

Select product_id, sum(price) as total_sales
from cte
group by product_id
