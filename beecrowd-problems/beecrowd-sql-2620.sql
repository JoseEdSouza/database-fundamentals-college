--https://www.beecrowd.com.br/judge/pt/problems/view/2620
SELECT
    c.name,
    o.id
FROM
    orders o
    join customers c ON o.id_customers = c.id
WHERE
    o.orders_date >= '2016-01-01'
    AND o.orders_date <= '2016-06-30';