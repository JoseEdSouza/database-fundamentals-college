--https://www.beecrowd.com.br/judge/pt/problems/view/2742
with t as (
    select
        d.name as d_name,
        l.name as p_name,
        l.omega
    from
        dimensions d
        join life_registry l on d.id = l.dimensions_id
    where
        d.name in ('C774', 'C875')
)
select
    t.p_name as name,
    round((t.omega * 1.618), 3) as "FATOR N"
from
    t
where
    t.p_name like 'Richard%'
order by
    t.omega ASC;