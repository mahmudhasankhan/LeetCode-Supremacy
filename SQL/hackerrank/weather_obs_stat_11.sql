select distinct city
from station
where city not like '%[AEIOU]' or city not like '[AEIOU]%'
