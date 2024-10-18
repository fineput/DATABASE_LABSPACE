select c.name, c.population
from cities c
join regions r on c.region = r.uuid
where r.area_quantity <= 5
and (c.population < 150000 or c.population > 500000);
