select state, n_businesses
from (select  
    state, 
    count(business_id) as n_businesses,
    rank() over(order by count(business_id) desc) as rnk
from yelp_business
where stars = 5
group by state) a
where rnk <= 5
order by n_businesses desc
