--https://www.beecrowd.com.br/judge/pt/problems/view/2995
select
    temperature,
    number_of_records
from
(
        select
            temperature,
            (sum(mark) / mark) as number_of_records,
            mark
        from
            records r
        group by
            temperature,
            mark
        order by
            mark
    ) t