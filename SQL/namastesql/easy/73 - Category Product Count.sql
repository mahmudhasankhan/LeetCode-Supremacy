/*
You are provided with a table that lists various product categories, each containing a comma-separated list of products. Your task is to write a SQL query to count the number of products in each category. Sort the result by product count.

 

Tables: categories
+-------------+-------------+
| COLUMN_NAME | DATA_TYPE   |
+-------------+-------------+
| category    | varchar(15) |
| products    | varchar(30) |
+-------------+-------------+
*/

-- Solution:
with cte as (select category, trim(c.value) as product
from categories 
cross apply string_split(products, ',') c )

select 
category,
count(product) as product_count
from cte
group by category
order by count(product)
