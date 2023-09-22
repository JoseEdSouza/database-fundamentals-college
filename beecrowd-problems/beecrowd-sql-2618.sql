--https://www.beecrowd.com.br/judge/pt/problems/view/2618
SELECT
    prod.name,
    prov.name,
    c.name
FROM
    products prod
    JOIN providers prov ON prod.id_providers = prov.id
    JOIN categories c ON prod.id_categories = c.id
WHERE
    prov.name = 'Sansul SA'
    AND c.name = 'Imported';