with order_counts as (

select count(order_id) as total_orders
from orders
)

select 
  CASE 
    WHEN order_id % 2 != 0 and order_id != total_orders then order_id + 1
    WHEN order_id %2 != 0 and order_id = total_orders then order_id
    else order_id - 1
    end as corrected_order_id,
    item 
FROM orders
cross join order_counts 
order by corrected_order_id;

-- learned how to swap ids with case functions.
