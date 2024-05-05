select city
from station
where city like 'a%'
or city like 'e%'
or city like 'i%'
or city like 'o%'
or city like 'u%'

-- dumb problem

-- More elegant way to solve this is: 
SELECT CITY
FROM STATION
WHERE CITY Like '[AEIOU]%';
