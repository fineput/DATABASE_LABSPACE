select name, population
from cities
where NOT region IN ('E', 'W')
order by population
limit 10 offset 10;
