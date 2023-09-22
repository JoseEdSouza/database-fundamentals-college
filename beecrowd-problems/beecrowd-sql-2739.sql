--https://www.beecrowd.com.br/judge/pt/problems/view/2739
select
    l.name,
    cast (
        EXTRACT(
            day
            from
                l.payday
        ) AS INT
    )
from
    loan l;