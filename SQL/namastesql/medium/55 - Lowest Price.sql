/*
You own a small online store, and want to analyze customer ratings for the products that you're selling. After doing a data pull, you have a list of products and a log of purchases. Within the purchase log, each record includes the number of stars (from 1 to 5) as a customer rating for the product.

For each category, find the lowest price among all products that received at least one 4-star or above rating from customers.
If a product category did not have any products that received at least one 4-star or above rating, the lowest price is considered to be 0. The final output should be sorted by product category in alphabetical order.

Table: products
+-------------+-------------+
| COLUMN_NAME | DATA_TYPE   |
+-------------+-------------+
| category    | varchar(10) |
| id          | int         |
| name        | varchar(20) |
| price       | int         |
+-------------+-------------+
Table: purchases
+-------------+-----------+
| COLUMN_NAME | DATA_TYPE |
+-------------+-----------+
| id          | int       |
| product_id  | int       |
| stars       | int       |
+-------------+-----------+
*/

-- Solution:

with high_rating_products as(select category, min(price) as lowest_price
from products
where id in (select  p.id
from products p 
join purchases ps
on p.id = ps.product_id
where ps.stars >= 4
group by p.id)
group by category )

, low_rating_products as (
  select category, 0 as lowest_price
from products
where category not in (select  p.category
from products p 
join purchases ps
on p.id = ps.product_id
where ps.stars >= 4
group by p.category)
group by category
 )



select * from high_rating_products
UNION
select * from low_rating_products
order by category

