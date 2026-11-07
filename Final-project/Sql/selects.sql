--clients who live in sp
select
    c.id,
    c.name,
    c.cpf
from
    client c
    join client_adress ca on c.id = ca.client_id
where
    ca.UF = 'SP';

-- final order price by order
with order_item_price as (
    SELECT
        oi.order_id,
        round(sum(i.price * oi.qntd) :: decimal, 2) as order_price,
        sum(oi.qntd) as total_qntd
    from
        order_item oi
        join orders o on oi.order_id = o.id
        JOIN item i on oi.item_id = i.id
    GROUP by
        oi.order_id
    ORDER BY
        oi.order_id ASC
),
total_order_price as (
    SELECT
        oip.order_id,
        c.id,
        c.name,
        round(
            (oip.order_price + o.delivery_price) :: decimal,
            2
        ) as total,
        oip.order_price,
        oip.total_qntd,
        o.delivery_price
    from
        order_item_price oip
        join orders o on o.id = oip.order_id
        join client_adress ca on o.cli_adr_id = ca.id
        join client c on ca.client_id = c.id
    order by
        oip.order_id ASC
)
SELECT
    *
from
    total_order_price;

--deliverys
select
    o.id as order_id,
    o.dm_id,
    ca.client_id,
    ca.street as cli_street,
    ca.bairro as cli_bairro,
    ca.num as cli_num,
    ca.city as cli_city,
    ca.uf as cli_uf,
    ca.ref_point as cli_ref_point,
    rest.adr_street as rest_street,
    rest.adr_bairro as rest_bairro,
    rest.adr_num as rest_num,
    rest.adr_city as rest_city,
    rest.adr_uf as rest_uf,
    rest.adr_ref_point as rest_ref_point
from
    orders o
    JOIN client_adress ca on o.cli_adr_id = ca.id
    JOIN restaurant rest on o.rest_id = rest.id;

-- client cards
select
    cc.client_id,
    c.name,
    cc.number,
    pm.name,
    cc.nickname,
    COALESCE(cc.cpf, 'X') as card_titular_cpf,
    cc.titular,
    cc.cvv,
    COALESCE(cc.cnpj, 'X') as card_titular_cnpj
from
    client_card cc
    join payment_method pm on cc.pm_id = pm.id
    join client c on cc.client_id = c.id;

--restaurant items sold
SELECT
    r.id AS restaurant_id,
    r.name AS restaurant_name,
    i.id AS item_id,
    i.name AS item_name,
    COUNT(o.id) AS order_count,
    COALESCE(SUM(i.price * oi.qntd), 0) AS total_earned
FROM
    restaurant r
    JOIN item i ON r.id = i.rest_id
    LEFT JOIN order_item oi ON i.id = oi.item_id
    LEFT JOIN orders o ON oi.order_id = o.id
GROUP BY
    r.id,
    r.name,
    i.id,
    i.name;