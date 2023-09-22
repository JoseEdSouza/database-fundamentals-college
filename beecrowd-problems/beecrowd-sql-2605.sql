--https://www.beecrowd.com.br/judge/pt/problems/view/2605
SELECT
    prod.name,
    prov.name
FROM
    products prod
    JOIN providers prov ON prod.id_providers = prov.id
    JOIN categories c ON prod.id_categories = c.id
WHERE
    c.id = 6;