--https://www.beecrowd.com.br/judge/pt/problems/view/2619
SELECT
    prod.name,
    prov.name,
    prod.price
FROM
    products prod
    JOIN providers prov ON prod.id_providers = prov.id
    JOIN categories c ON prod.id_categories = c.id
WHERE
    prod.price > 1000
    AND c.name = 'Super Luxury';