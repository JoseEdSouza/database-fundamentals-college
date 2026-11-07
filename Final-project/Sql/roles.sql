
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

