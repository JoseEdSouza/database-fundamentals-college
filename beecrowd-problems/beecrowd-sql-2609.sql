--https://www.beecrowd.com.br/judge/pt/problems/view/2609
SELECT
    c.name,
    SUM(p.amount) as sum
FROM
    products p
    INNER JOIN categories c ON p.id_categories = c.id
GROUP BY
    c.name;