select region, count(*) as city_count, sum(population) as total_popylation
from cities
group by region
having city_count >= 10;
