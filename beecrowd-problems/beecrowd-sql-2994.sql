--https://www.beecrowd.com.br/judge/pt/problems/view/2994
with t as (
    select
        d.name,
(150 * a.hours) * (1 + (w.bonus / 100)) as salary
    from
        attendances a
        join doctors d on a.id_doctor = d.id
        join work_shifts w on a.id_work_shift = w.id
)
SELECT
    t.name,
    ROUND(sum(t.salary), 1) AS salary
FROM
    t
GROUP BY
    t.name
ORDER BY
    salary DESC;