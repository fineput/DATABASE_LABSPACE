select region, sum(population) as sum_population
from cities
where region in('C', 'S')
group by region;
