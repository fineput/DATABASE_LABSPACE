select region, sum(population) as total_population
from cities
group by region;
