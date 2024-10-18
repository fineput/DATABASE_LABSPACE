select region, sum(population) as total_population
from cities
where population > 300000
group by region;
