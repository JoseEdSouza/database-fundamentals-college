--https://www.beecrowd.com.br/judge/pt/problems/view/2622
SELECT
    c.name
FROM
    customers c
    LEFT JOIN legal_person lp ON c.id = lp.id_customers
WHERE
    lp.cnpj IS NOT NULL;