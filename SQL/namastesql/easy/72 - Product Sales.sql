/*
You are provided with two tables: Products and Sales. The Products table contains information about various products, including their IDs, names, and prices. The Sales table contains data about sales transactions, including the product IDs, quantities sold, and dates of sale. Your task is to write a SQL query to find the total sales amount for each product. Display product name and total sales . Sort the result by product name.

 

Table: products
+--------------+-------------+
| COLUMN_NAME  | DATA_TYPE   |
+--------------+-------------+
| product_id   | int         |
| product_name | varchar(10) |
| price        | int         |
+--------------+-------------+
Table: sales
+-------------+-----------+
| COLUMN_NAME | DATA_TYPE |
+-------------+-----------+
| sale_id     | int       |
| product_id  | int       |
| quantity    | int       |
| sale_date   | date      |
+-------------+-----------+

*/

-- Solution:

select p.product_name, sum((p.price * s.quantity)) as total_sale_price
from products p 
join sales s 
on p.product_id = s.product_id
group by p.product_name
order by p.product_name
