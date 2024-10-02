select name, population
from cities
where population > 150000
  AND population < 350000
  AND region IN ('E', 'W', 'N')
order by name
limit 20;
