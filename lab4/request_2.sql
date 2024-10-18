select name, char_length(name) as length_name
from cities
where char_length(name) not in (8, 9, 10);
