--https://www.beecrowd.com.br/judge/pt/problems/view/2741
select
    ('Approved: ' || name) as name,
    grade
from
    students
where
    grade >= 7.0
order by
    grade DESC;