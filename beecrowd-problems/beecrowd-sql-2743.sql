--https://www.beecrowd.com.br/judge/pt/problems/view/2743
select
    name,
    length(name) as length
from
    people
order by
    length desc;