--https://www.beecrowd.com.br/judge/pt/problems/view/2745
with t as(
    select
        name,
        salary
    from
        people
    where
        salary > 3000
)
select
    name,
    round(salary * 0.1, 2) as tax
from
    t;