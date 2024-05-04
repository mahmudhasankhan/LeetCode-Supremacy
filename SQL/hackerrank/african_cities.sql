select c.name
from city as c
join country as co
on c.countrycode = co.code
where co.continent = 'Africa'
