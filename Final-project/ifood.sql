CREATE SEQUENCE cat_id_seq INCREMENT BY 1 MINVALUE 1 MAXVALUE 9223372036854775807 START 1 CACHE 1 NO CYCLE;

-- public.client_adress_id_seq definition
-- DROP SEQUENCE public.client_adress_id_seq;
CREATE SEQUENCE client_adress_id_seq INCREMENT BY 1 MINVALUE 1 MAXVALUE 2147483647 START 1 CACHE 1 NO CYCLE;

-- public.client_adress_id_seq definition
-- DROP SEQUENCE public.client_adress_id_seq;
CREATE SEQUENCE client_id_seq INCREMENT BY 1 MINVALUE 1 MAXVALUE 2147483647 START 1 CACHE 1 NO CYCLE;

-- public.entregador_id_seq definition
-- DROP SEQUENCE public.entregador_id_seq;
CREATE SEQUENCE entregador_id_seq INCREMENT BY 1 MINVALUE 1 MAXVALUE 2147483647 START 1 CACHE 1 NO CYCLE;

-- public.item_id_seq definition
-- DROP SEQUENCE public.item_id_seq;
CREATE SEQUENCE public.item_id_seq INCREMENT BY 1 MINVALUE 1 MAXVALUE 2147483647 START 1 CACHE 1 NO CYCLE;

-- public.orders_id_seq definition
-- DROP SEQUENCE public.orders_id_seq;
CREATE SEQUENCE orders_id_seq INCREMENT BY 1 MINVALUE 1 MAXVALUE 2147483647 START 1 CACHE 1 NO CYCLE;

-- public.payment_method_id_seq definition
-- DROP SEQUENCE public.payment_method_id_seq;
CREATE SEQUENCE payment_method_id_seq INCREMENT BY 1 MINVALUE 1 MAXVALUE 2147483647 START 1 CACHE 1 NO CYCLE;

-- public.rest_id_seq definition
-- DROP SEQUENCE public.rest_id_seq;
CREATE SEQUENCE rest_id_seq INCREMENT BY 1 MINVALUE 1 MAXVALUE 9223372036854775807 START 1 CACHE 1 NO CYCLE;

-- public.proprietary definition
-- Drop table
-- DROP TABLE proprietary;
CREATE TABLE proprietary (
    cpf varchar(11) NOT NULL,
    "name" varchar NOT NULL,
    agency_number varchar NOT NULL,
    account_number varchar NOT NULL,
    email varchar NOT NULL,
    phone varchar NOT NULL,
    CONSTRAINT proprietary_pk PRIMARY KEY (cpf)
);

-- public.category definition
-- Drop table
-- DROP TABLE category;
CREATE TABLE category (
    id int4 NOT NULL DEFAULT nextval('cat_id_seq' :: regclass),
    "name" varchar(30) NOT NULL,
    CONSTRAINT category_pkey PRIMARY KEY (id)
);

-- public.restaurant definition
-- Drop table
-- DROP TABLE restaurant;
CREATE TABLE restaurant (
    id int4 NOT NULL DEFAULT nextval('rest_id_seq' :: regclass),
    "name" varchar NOT NULL,
    email varchar NOT NULL,
    adr_street varchar NOT NULL,
    adr_num varchar NOT NULL,
    adr_uf bpchar(2) NOT NULL,
    adr_compl varchar NULL,
    adr_bairro varchar NOT NULL,
    adr_city varchar NOT NULL,
    adr_ref_point varchar NOT NULL,
    cnpj varchar(14) NOT NULL,
    telefone varchar NOT NULL,
    raio_de_entrega float4 NOT NULL,
    prop_cpf varchar(11) NOT NULL,
    cat_id int4 NOT NULL,
    CONSTRAINT restaurante_pk PRIMARY KEY (id),
    CONSTRAINT restaurante_un UNIQUE (cnpj),
    CONSTRAINT restaurante_cat_id_fkey FOREIGN KEY (cat_id) REFERENCES category(id) ON UPDATE CASCADE,
    CONSTRAINT restaurante_fk FOREIGN KEY (prop_cpf) REFERENCES proprietary(cpf) ON UPDATE CASCADE
);

-- public.item definition
-- Drop table
-- DROP TABLE item;
CREATE TABLE item (
    id serial4 NOT NULL,
    rest_id int4 NOT NULL,
    cat_id int4 NOT NULL,
    "name" varchar NOT NULL,
    price float8 NOT NULL,
    description varchar NULL,
    classification int4 NULL,
    CONSTRAINT item_pkey PRIMARY KEY (id),
    CONSTRAINT item_cat_id_fkey FOREIGN KEY (cat_id) REFERENCES category(id) ON UPDATE CASCADE,
    CONSTRAINT item_rest_id_fkey FOREIGN KEY (rest_id) REFERENCES restaurant(id) ON UPDATE CASCADE
);

-- public.payment_method definition
-- Drop table
-- DROP TABLE payment_method;
CREATE TABLE payment_method (
    id serial4 NOT NULL,
    "name" varchar NOT NULL,
    CONSTRAINT payment_method_pkey PRIMARY KEY (id)
);

-- public.client definition
-- Drop table
-- DROP TABLE client;
CREATE TABLE client (
    id serial4 NOT NULL,
    cpf varchar(11) NOT NULL,
    "name" varchar NOT NULL,
    email varchar NOT NULL,
    telefone varchar NOT NULL,
    CONSTRAINT client_pkey PRIMARY KEY (id)
);

-- public.client_adress definition
-- Drop table
-- DROP TABLE client_adress;
CREATE TABLE client_adress (
    id serial4 NOT NULL,
    client_id int4 NOT NULL,
    street varchar NOT NULL,
    bairro varchar NOT NULL,
    num varchar NOT NULL,
    uf bpchar(2) NOT NULL,
    compl varchar NULL,
    city varchar NOT NULL,
    ref_point varchar NOT NULL,
    nickname varchar NULL,
    CONSTRAINT client_adress_pkey PRIMARY KEY (id),
    CONSTRAINT client_adress_client_id_fkey FOREIGN KEY (client_id) REFERENCES client(id) ON UPDATE CASCADE
);

-- public.client_card definition
-- Drop table
-- DROP TABLE client_card;
CREATE TABLE client_card (
    pm_id int4 NOT NULL,
    client_id int4 NOT NULL,
    nickname varchar NOT NULL,
    "number" varchar(16) NOT NULL,
    cpf varchar(11) NULL,
    titular varchar NOT NULL,
    cvv bpchar(3) NOT NULL,
    cnpj varchar(14) NULL,
    CONSTRAINT client_card_pk PRIMARY KEY (client_id, number),
    CONSTRAINT client_card_client_id_fkey FOREIGN KEY (client_id) REFERENCES client(id) ON UPDATE CASCADE,
    CONSTRAINT client_card_pm_id_fk FOREIGN KEY (pm_id) REFERENCES payment_method(id) ON UPDATE CASCADE
);

-- public.deliveryman definition
-- Drop table
-- DROP TABLE deliveryman;
CREATE TABLE deliveryman (
    id int4 NOT NULL DEFAULT nextval('entregador_id_seq' :: regclass),
    cpf varchar(11) NOT NULL,
    rg varchar NOT NULL,
    cnh varchar(10) NULL,
    "name" varchar NOT NULL,
    email varchar NOT NULL,
    city varchar NOT NULL,
    uf bpchar(2) NOT NULL,
    agency_number varchar NOT NULL,
    account_number varchar NOT NULL,
    CONSTRAINT entregador_pkey PRIMARY KEY (id)
);

-- public.orders definition
-- Drop table
-- DROP TABLE orders;
CREATE TABLE orders (
    id serial4 NOT NULL,
    dm_id int4 NOT NULL,
    rest_id int4 NOT NULL,
    cli_adr_id int4 NOT NULL,
    pm_id int4 NOT NULL,
    date_time timestamp NOT NULL,
    delivery_price float8 NOT NULL,
    CONSTRAINT orders_pkey PRIMARY KEY (id),
    CONSTRAINT orders_dm_id_fkey FOREIGN KEY (dm_id) REFERENCES deliveryman(id) ON UPDATE CASCADE,
    CONSTRAINT orders_fk FOREIGN KEY (cli_adr_id) REFERENCES client_adress(id) ON UPDATE CASCADE,
    CONSTRAINT orders_fk_pm_id FOREIGN KEY (pm_id) REFERENCES payment_method(id) ON UPDATE CASCADE,
    CONSTRAINT orders_rest_id_fkey FOREIGN KEY (rest_id) REFERENCES restaurant(id) ON UPDATE CASCADE
);

-- public.order_item definition
-- Drop table
-- DROP TABLE order_item;
CREATE TABLE order_item (
    order_id int4 NOT NULL,
    item_id int4 NOT NULL,
    qntd int4 NULL,
    CONSTRAINT order_item_pkey PRIMARY KEY (order_id, item_id),
    CONSTRAINT order_item_item_id_fkey FOREIGN KEY (item_id) REFERENCES item(id) ON UPDATE CASCADE,
    CONSTRAINT order_item_order_id_fkey FOREIGN KEY (order_id) REFERENCES orders(id) ON UPDATE CASCADE
);

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
    i.name
ORDER BY
    r.id ASC;

--client showcase
SELECT
    *
FROM
    client c
    LEFT JOIN client_adress ca ON c.id = ca.client_id
    LEFT JOIN client_card cc ON c.id = cc.client_id
    LEFT JOIN orders o ON c.id = o.cli_adr_id;

CREATE OR REPLACE VIEW res_order AS
SELECT o.id, o.rest_id, r.name AS restaurant_name, oi.item_id, i.name AS item_name, oi.qntd
FROM orders o
JOIN restaurant r ON o.rest_id = r.id
JOIN order_item oi ON oi.order_id = o.id
JOIN item i ON oi.item_id = i.id
ORDER BY o.id;

-- orders price by restaurant
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

-- cards of clients
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

-- adresses of clients
CREATE OR REPLACE VIEW cli_adr as
SELECT c.id as client_id,c.name as client_name,ca.id as adress_id,ca.street,ca.bairro,ca.num,ca.uf,ca.city,ca.ref_point,ca.nickname as apelido
from client_adress ca 
join client c on ca.client_id = c.id
order by c.id ASC;

-- deliverys
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


-- creating and setting admin role
CREATE role "administrador";

GRANT USAGE ON ALL SEQUENCES IN SCHEMA public to administrador;

GRANT SELECT, INSERT, UPDATE, DELETE
ON ALL TABLES IN SCHEMA public 
TO administrador;

GRANT CONNECT ON DATABASE ifood to administrador;

--creating user adm and grating it admin role
CREATE USER "ADM"
LOGIN
PASSWORD '12345';

GRANT administrador to "ADM";

-- creating and setting establishment role
CREATE role "estabelecimento";

GRANT SELECT, INSERT, UPDATE, DELETE
ON item
TO "estabelecimento";

GRANT SELECT
ON res_order,res_price_order
TO "estabelecimento";

-- creating user establishment and granting it estab role

CREATE USER "restaurante1"
LOGIN
PASSWORD '12345';

GRANT estabelecimento to "restaurante1";


-- creating and setting customer role

CREATE role "cliente";

GRANT SELECT, INSERT, UPDATE, DELETE
ON client_adress,client_card
TO "cliente";

GRANT SELECT
ON cli_adr,cli_card,deliverys
TO "cliente";

-- creating user customer and granting it estab role

CREATE USER "cliente1"
LOGIN
PASSWORD '12345';

GRANT cliente to "cliente1";

-- creating and setting deliveryman role
CREATE role "entregador";

GRANT SELECT 
on deliverys 
to "entregador";

-- creating user deliveryman and granting it dm role

CREATE USER "entregador1"
LOGIN
PASSWORD '12345';

GRANT entregador to "entregador1";
