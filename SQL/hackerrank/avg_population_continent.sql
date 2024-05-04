select co.continent, round(avg(c.population), 0)
from city as c
join country as co
on c.countrycode = co.code
group by co.continent
