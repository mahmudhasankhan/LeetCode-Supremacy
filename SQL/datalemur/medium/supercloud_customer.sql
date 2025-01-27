with cte as (SELECT c.customer_id, count(distinct p.product_category) as cnt_of_cats 
FROM customer_contracts c 
join products p on c.product_id = p.product_id
group by c.customer_id
)

select customer_id from cte where cnt_of_cats = 3;
