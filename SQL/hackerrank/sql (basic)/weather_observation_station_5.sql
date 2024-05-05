
select top(1) city, len(city)
from station
group by city
order by len(city), city

select top(1) city, len(city)
from station
group by city 
order by len(city) desc, city

-- didnt know len function, learned something new. Maxed out time limit of 2m.
