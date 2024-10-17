select concat(name, ' (', region, ')') as list_city_region
from cities
where population > 100000
order by name asc;
