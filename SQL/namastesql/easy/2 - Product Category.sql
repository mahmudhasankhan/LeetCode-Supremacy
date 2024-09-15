/*
You are provided with a table named Products containing information about various products, including their names and prices. Write a SQL query to count number of products in each category based on its price into three categories below. Display the output in descending order of no of products.

 

1- "Low Price" for products with a price less than 100
2- "Medium Price" for products with a price between 100 and 500 (inclusive)
3- "High Price" for products with a price greater than 500.
Tables: Products
+--------------+-------------+
| COLUMN_NAME  | DATA_TYPE   |
+--------------+-------------+
| product_id   | int         |
| product_name | varchar(20) |
| price        | int         |
+--------------+-------------+
*/

-- Solution:

with cte as (select 
	product_id,
    product_name,
    case 
    when price > 500 THEN "High Price"
    when price < 100 then "Low Price"
    else "Medium Price"
    end as product_category,
    price
    from products)
select 
	product_category as category,
    count(price) as no_of_products
    from cte
group by product_category
order by count(price) desc
