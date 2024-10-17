select concat(name, ' - ', ((population / 4000000) * 100), '%') as city_population_procent
from cities
where (population / 4000000) * 100 >= 0.1
order by (population / 4000000) * 100 desc;
