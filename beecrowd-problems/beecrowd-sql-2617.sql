--https://www.beecrowd.com.br/judge/pt/problems/view/2617
SELECT
    prod.name,
    prov.name
FROM
    products prod
    JOIN providers prov ON prod.id_providers = prov.id
WHERE
    prov.name = 'Ajax SA';