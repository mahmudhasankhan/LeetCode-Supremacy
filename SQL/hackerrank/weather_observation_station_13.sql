select cast(sum(lat_n) as decimal(10,4))
from station
where lat_n between 38.7880 and 137.2345
