select name, population
from cities
where region in ('S', 'C', 'N') AND population > 50000;
