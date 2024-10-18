select c.name, c.population
from cities c
join regions r on c.region = r.uuid
where r.area_quantity >= 5
order by c.population desc
limit 5 OFFSET 10;
