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