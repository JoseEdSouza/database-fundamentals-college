--https://www.beecrowd.com.br/judge/pt/problems/view/2740
select
    team
from
(
        (
            select
                position,
('Podium: ' || team) as team
            from
                league
            limit
                3
        )
        union
        (
            select
                position,
('Demoted: ' || team) as team
            from
                league
            order by
                position desc
            limit
                2
        )
        order by
            position asc
    ) as tableDoPae;