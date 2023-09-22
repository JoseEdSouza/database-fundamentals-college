--https://www.beecrowd.com.br/judge/pt/problems/view/2614
SELECT
    c.name,
    r.rentals_date
FROM
    rentals r
    JOIN customers c ON r.id_customers = c.id
WHERE
    r.rentals_date >= ' 2016-09-01 '
    AND r.rentals_date <= '2016-09-30';