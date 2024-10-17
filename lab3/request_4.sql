select name, population, (population / 4000000) * 100 as population_procent
from cities
order by population desc
limit 10;
