--https://www.beecrowd.com.br/judge/pt/problems/view/3001
select
    name,
    CASE
        when "type" = 'A' then 20.0
        when "type" = 'B' then 70.0
        when "type" = 'C' then 530.5
    end as price
from
    products
order by
    "type" ASC,
    id DESC;