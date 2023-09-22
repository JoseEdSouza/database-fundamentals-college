--https://www.beecrowd.com.br/judge/pt/problems/view/2621
SELECT
    prod.name
FROM
    products prod
    JOIN providers prov ON prod.id_providers = prov.id
WHERE
    prov.name like 'P%'
    AND prod.amount BETWEEN 10
    AND 20;