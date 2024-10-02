select name, population
from cities
where region IN ('E', 'W')
order by population;
