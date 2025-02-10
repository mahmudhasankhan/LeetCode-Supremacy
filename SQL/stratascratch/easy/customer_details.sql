select first_name, last_name, city, o.order_details
from customers c  
left join orders o on c.id = o.cust_id;
