select distinct city
from station
where city not like '%[AEIOU]' and city not like '[AEIOU]%'
