
select cast( sqrt(square(min(lat_n) - max(lat_n)) + square(min(long_w) - max(long_w))) as decimal(10,4) )
from station
