--https://www.beecrowd.com.br/judge/pt/problems/view/2610
SELECT
    ROUND(AVG(p.price), 2) AS price
FROM
    products p;