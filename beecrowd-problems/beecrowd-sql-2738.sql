--https://www.beecrowd.com.br/judge/pt/problems/view/2738
with avgtable as(
    select
        c.id,
        c.name,
        s.math,
        s.specific,
        s.project_plan
    from
        candidate c
        join score s on c.id = s.candidate_id
)
select
    c.name,
    round(
        ((c.math * 2 + c.specific * 3 + c.project_plan * 5) / 10),
        2
    ) as avg
from
    avgtable c
order by
    avg DESC;