with cte2020 as (select company_name, count(product_name) as product_count
from car_launches
where year = 2020
group by company_name
-- order by company_name
)
,
cte2019 as (
select company_name, count(product_name) as product_count
from car_launches
where year = 2019
group by company_name
-- order by company_name
)

select a.company_name, a.product_count - b.product_count as net_products
from cte2020 as a
join cte2019 as b on a.company_name = b.company_name
order by a.company_name
