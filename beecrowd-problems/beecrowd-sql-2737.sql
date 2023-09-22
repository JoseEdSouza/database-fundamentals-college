--https://www.beecrowd.com.br/judge/pt/problems/view/2737
with t as(
    SELECT
        1 as id,
        name,
        customers_number
    FROM
        lawyers
    WHERE
        customers_number = (
            SELECT
                MAX(customers_number)
            FROM
                lawyers
        ) -- Advogado com mais clientes
    union
    SELECT
        2 as id,
        name,
        customers_number
    FROM
        lawyers
    WHERE
        customers_number = (
            SELECT
                MIN(customers_number)
            FROM
                lawyers
        ) -- Advogado com menos clientes
    union
    SELECT
        3 as id,
        'Average' AS name,
        Floor(AVG(customers_number)) AS customers_number
    FROM
        lawyers
    order by
        id
)
select
    name,
    customers_number
from
    t;