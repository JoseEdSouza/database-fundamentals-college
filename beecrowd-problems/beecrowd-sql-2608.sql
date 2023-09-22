--https://www.beecrowd.com.br/judge/pt/problems/view/2608
SELECT
    MAX(p.price),
    MIN(p.price)
FROM
    products p;