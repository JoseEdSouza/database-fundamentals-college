CREATE OR REPLACE VIEW res_order AS
SELECT o.id, o.rest_id, r.name AS restaurant_name, oi.item_id, i.name AS item_name, oi.qntd
FROM orders o
JOIN restaurant r ON o.rest_id = r.id
JOIN order_item oi ON oi.order_id = o.id
JOIN item i ON oi.item_id = i.id
ORDER BY o.id;

CREATE OR REPLACE VIEW res_price_order as
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
    i.name
ORDER BY
    r.id ASC;

CREATE OR REPLACE VIEW cli_card AS
select
    cc.client_id,
    c.name as nome,
    cc.number,
    pm.name as função,
    cc.nickname as apelido,
    COALESCE(cc.cpf, 'X') as titular_cpf,
    cc.titular,
    cc.cvv,
    COALESCE(cc.cnpj, 'X') as titular_cnpj
from
    client_card cc
    join payment_method pm on cc.pm_id = pm.id
    join client c on cc.client_id = c.id;



CREATE OR REPLACE VIEW cli_adr as
SELECT c.id,c.name as client_id,ca.id as adress_id,ca.street,ca.bairro,ca.num,ca.uf,ca.city,ca.ref_point,ca.nickname as apelido
from client_adress ca 
join client c on ca.client_id = c.id
order by c.id ASC;

CREATE or REPLACE VIEW deliverys as
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
