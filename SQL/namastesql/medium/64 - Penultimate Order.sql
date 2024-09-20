/*
You are a data analyst working for an e-commerce company, responsible for analysing customer orders to gain insights into their purchasing behaviour. Your task is to write a SQL query to retrieve the details of the penultimate order for each customer. However, if a customer has placed only one order, you need to retrieve the details of that order instead, display the output in ascending order of customer name.

 

Table: orders
+---------------+-------------+
| COLUMN_NAME   | DATA_TYPE   |
+---------------+-------------+
| order_id      | int         |
| order_date    | date        |
| customer_name | varchar(10) |
| product_name  | varchar(10) |
| sales         | int         |
+---------------+-------------+
*/

-- Solution:

with penultimate_orders as 
(       select *,
        row_number() over(partition by customer_name order by order_date desc) as row_num
        from orders
)

select order_id, order_date, customer_name, product_name, sales
from penultimate_orders
where row_num = 2
UNION
select *
from orders
where customer_name = (
select customer_name
from orders
group by customer_name
having count(sales) = 1  )
order by customer_name

