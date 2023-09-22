--https://www.beecrowd.com.br/judge/pt/problems/view/2623
SELECT
    prod.name,
    c.name
FROM
    products prod
    JOIN categories c ON prod.id_categories = c.id
WHERE
    prod.amount > 100
    AND c.id IN (1, 2, 3, 6, 9)
ORDER BY
    c.id ASC;