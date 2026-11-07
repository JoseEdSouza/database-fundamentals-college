INSERT INTO
    proprietary (
        cpf,
        name,
        agency_number,
        account_number,
        email,
        phone
    )
VALUES
    (
        '12345678901',
        'João Silva',
        '001',
        '12345',
        'joao.silva@example.com',
        '(11) 1234-5678'
    ),
    (
        '98765432101',
        'Maria Santos',
        '002',
        '67890',
        'maria.santos@example.com',
        '(21) 9876-5432'
    ),
    (
        '65432198701',
        'Pedro Almeida',
        '003',
        '24680',
        'pedro.almeida@example.com',
        '(71) 6543-2198'
    ),
    (
        '98765432102',
        'Ana Oliveira',
        '004',
        '13579',
        'ana.oliveira@example.com',
        '(11) 9876-5432'
    ),
    (
        '12345678902',
        'Rafael Mendes',
        '005',
        '97531',
        'rafael.mendes@example.com',
        '(31) 1234-5678'
    ),
    (
        '98765432103',
        'Juliana Costa',
        '006',
        '35791',
        'juliana.costa@example.com',
        '(21) 6543-2198'
    ),
    (
        '65432198703',
        'Carlos Ferreira',
        '007',
        '46802',
        'carlos.ferreira@example.com',
        '(51) 6543-2198'
    ),
    (
        '98765432104',
        'Camila Gomes',
        '008',
        '90234',
        'camila.gomes@example.com',
        '(11) 9876-5432'
    ),
    (
        '65432198704',
        'Luciana Rocha',
        '009',
        '74310',
        'luciana.rocha@example.com',
        '(21) 6543-2198'
    ),
    (
        '12345678903',
        'Gustavo Lima',
        '010',
        '61943',
        'gustavo.lima@example.com',
        '(31) 1234-5678'
    );

INSERT INTO
    category (name)
VALUES
    ('brasileira'),
    ('doces e bolos'),
    ('frutos do mar'),
    ('variada'),
    ('regional'),
    ('lanche'),
    ('churrasco'),
    ('pizza'),
    ('vegetariana'),
    ('japonesa');

INSERT INTO
    restaurant (
        name,
        email,
        adr_street,
        adr_num,
        adr_uf,
        adr_compl,
        adr_bairro,
        adr_city,
        adr_ref_point,
        cnpj,
        telefone,
        raio_de_entrega,
        prop_cpf,
        cat_id
    )
VALUES
    -- Restaurant 'Sabor Divino'
    (
        'Sabor Divino',
        'contato@sabordivino.com',
        'Rua dos Sabores',
        '123',
        'SP',
        'Sala 1',
        'Centro',
        'São Paulo',
        'Perto da Praça',
        '12345678900001',
        '(11) 1234-5678',
        5,
        '12345678901',
        1
    ),
    -- Restaurant 'Gastronomia Criativa'
    (
        'Gastronomia Criativa',
        'contato@gastronomiacriativa.com',
        'Avenida dos Sabores',
        '456',
        'RJ',
        'Andar 2',
        'Copacabana',
        'Rio de Janeiro',
        'Perto da Praia',
        '98765432100001',
        '(21) 9876-5432',
        10,
        '98765432101',
        2
    ),
    -- Restaurant 'Delícias do Mar'
    (
        'Delícias do Mar',
        'contato@deliciasdomar.com',
        'Rua dos Pescadores',
        '789',
        'BA',
        'Loja 3',
        'Farol da Barra',
        'Salvador',
        'Perto do Farol',
        '65432198700001',
        '(71) 6543-2198',
        8,
        '65432198701',
        3
    ),
    -- Restaurant 'Sabores Exóticos'
    (
        'Sabores Exóticos',
        'contato@saboresexoticos.com',
        'Rua das Especiarias',
        '987',
        'SP',
        'Andar 5',
        'Vila Madalena',
        'São Paulo',
        'Perto do Metrô',
        '98765432100002',
        '(11) 9876-5432',
        6,
        '98765432102',
        4
    ),
    -- Restaurant 'Cantinho da Serra'
    (
        'Cantinho da Serra',
        'contato@cantinhodaserra.com',
        'Rua das Montanhas',
        '654',
        'MG',
        'Casa 2',
        'Centro',
        'Belo Horizonte',
        'Perto da Praça',
        '12345678900002',
        '(31) 1234-5678',
        12,
        '12345678902',
        5
    ),
    -- Restaurant 'Sabores do Oriente'
    (
        'Sabores do Oriente',
        'contato@saboresdooriente.com',
        'Avenida das Especiarias',
        '321',
        'RJ',
        'Loja 7',
        'Centro',
        'Rio de Janeiro',
        'Perto do Mercado',
        '98765432100003',
        '(21) 9876-5432',
        10,
        '98765432103',
        6
    ),
    -- Restaurant 'Fogão Gaúcho'
    (
        'Fogão Gaúcho',
        'contato@fogaogauchorestaurante.com',
        'Rua dos Churrascos',
        '159',
        'RS',
        'Sala 4',
        'Centro',
        'Porto Alegre',
        'Perto da Praça',
        '65432198700003',
        '(51) 6543-2198',
        15,
        '65432198703',
        7
    ),
    -- Restaurant 'Pizza Mágica'
    (
        'Pizza Mágica',
        'contato@pizzamagica.com',
        'Rua das Pizzas',
        '753',
        'SP',
        'Andar 3',
        'Moema',
        'São Paulo',
        'Perto do Parque',
        '98765432100004',
        '(11) 9876-5432',
        8,
        '98765432104',
        8
    ),
    -- Restaurant 'Delícias Vegetarianas'
    (
        'Delícias Vegetarianas',
        'contato@deliciasvegetarianas.com',
        'Rua das Hortaliças',
        '852',
        'RJ',
        'Loja 6',
        'Botafogo',
        'Rio de Janeiro',
        'Perto do Jardim',
        '65432198700004',
        '(21) 6543-2198',
        10,
        '65432198704',
        9
    ),
    -- Restaurant 'Sabor da Roça'
    (
        'Sabor da Roça',
        'contato@sabordaroca.com',
        'Rua da Fazenda',
        '357',
        'MG',
        'Casa 1',
        'Centro',
        'Belo Horizonte',
        'Perto do Parque',
        '12345678900003',
        '(31) 1234-5678',
        12,
        '12345678903',
        5
    );

INSERT INTO
    item (
        rest_id,
        cat_id,
        name,
        price,
        description,
        classification
    )
VALUES
    -- Itens para o Restaurante Sabor Divino
    (
        1,
        3,
        'Risoto de Frutos do Mar',
        35.90,
        'Delicioso risoto preparado com frutos do mar frescos.',
        4.5
    ),
    (
        1,
        2,
        'Torta de Chocolate com Morango',
        15.50,
        'Uma torta incrível com camadas de chocolate e morango.',
        4.2
    ),
    -- Itens para o Restaurante Gastronomia Criativa
    (
        2,
        4,
        'Frango ao Curry com Purê de Batatas',
        28.90,
        'Um prato exótico com frango ao curry acompanhado de purê de batatas cremoso.',
        4.8
    ),
    (
        2,
        2,
        'Pudim de Tapioca',
        12.00,
        'Um pudim feito com tapioca e leite de coco, uma sobremesa irresistível.',
        4.4
    ),
    -- Itens para o Restaurante Delícias do Mar
    (
        3,
        3,
        'Moqueca de Camarão',
        42.50,
        'Uma moqueca tradicional de camarão, com um toque especial de temperos regionais.',
        4.9
    ),
    (
        3,
        2,
        'Mousse de Maracujá',
        10.00,
        'Um mousse leve e refrescante feito com suco natural de maracujá.',
        4.5
    ),
    -- Itens para o Restaurante Sabores Exóticos
    (
        4,
        9,
        'Pad Thai de Legumes',
        24.90,
        'Uma versão vegetariana do famoso prato tailandês Pad Thai, com legumes frescos e macarrão de arroz.',
        4.7
    ),
    (
        4,
        2,
        'Bolo de Matcha',
        14.00,
        'Um bolo delicado e aromático feito com chá matcha, perfeito para os amantes de chá verde.',
        4.3
    ),
    -- Itens para o Restaurante Cantinho da Serra
    (
        5,
        5,
        'Feijoada Mineira',
        38.50,
        'Uma feijoada completa com carnes selecionadas, acompanhada de arroz, couve, farofa e laranja.',
        4.6
    ),
    (
        5,
        1,
        'Pão de Queijo Recheado',
        8.50,
        'Pãezinhos de queijo recheados com requeijão cremoso, uma delícia típica de Minas Gerais.',
        4.2
    ),
    -- Itens para o Restaurante Sabores do Oriente
    (
        6,
        10,
        'Yakisoba de Legumes',
        27.90,
        'Um prato clássico da culinária oriental, com macarrão, legumes frescos e molho especial.',
        4.7
    ),
    (
        6,
        2,
        'Harumaki de Nutella',
        9.00,
        'Deliciosos rolinhos primavera recheados com Nutella, uma sobremesa irresistível.',
        4.4
    ),
    -- Itens para o Restaurante Fogão Gaúcho
    (
        7,
        7,
        'Churrasco Misto',
        45.90,
        'Uma seleção de carnes grelhadas na churrasqueira, acompanhadas de farofa e vinagrete.',
        4.9
    ),
    (
        7,
        2,
        'Pudim de Leite Condensado',
        11.00,
        'Um pudim tradicional, cremoso e com sabor irresistível de leite condensado.',
        4.6
    ),
    -- Itens para o Restaurante Pizza Mágica
    (
        8,
        8,
        'Pizza Quatro Queijos',
        33.90,
        'Uma deliciosa pizza com uma combinação de quatro queijos: muçarela, provolone, gorgonzola e parmesão.',
        4.8
    ),
    (
        8,
        2,
        'Tiramisu',
        15.00,
        'Uma clássica sobremesa italiana com camadas de biscoitos, café, mascarpone e cacau.',
        4.3
    ),
    -- Itens para o Restaurante Delícias Vegetarianas
    (
        9,
        9,
        'Hambúrguer Vegetariano',
        29.90,
        'Um hambúrguer suculento feito com ingredientes vegetais de alta qualidade, acompanhado de batatas rústicas.',
        4.7
    ),
    (
        9,
        2,
        'Cheesecake de Frutas Vermelhas',
        12.50,
        'Um cheesecake cremoso com uma generosa cobertura de frutas vermelhas frescas.',
        4.5
    ),
    -- Itens para o Restaurante Sabor da Roça
    (
        10,
        5,
        'Galinhada Caipira',
        32.50,
        'Uma deliciosa galinhada preparada no estilo caipira, com arroz, frango e temperos especiais.',
        4.6
    ),
    (
        10,
        2,
        'Doce de Abóbora',
        9.00,
        'Um doce tradicional feito com abóbora, coco e um toque de especiarias.',
        4.2
    );

INSERT INTO
    payment_method (name)
VALUES
    ('dinheiro'),
    ('debito'),
    ('credito'),
    ('pix'),
    ('vr'),
    ('paypal');

INSERT INTO
    client (cpf, name, email, telefone)
VALUES
    (
        '12345678901',
        'Miles Morales',
        'miles@spiderverse.com',
        '(123) 456-7890'
    ),
    (
        '23456789012',
        'Peter B. Parker',
        'peter@spiderverse.com',
        '(234) 567-8901'
    ),
    (
        '34567890123',
        'Gwen Stacy',
        'gwen@spiderverse.com',
        '(345) 678-9012'
    ),
    (
        '45678901234',
        'Spider-Man Noir',
        'noir@spiderverse.com',
        '(456) 789-0123'
    ),
    (
        '56789012345',
        'Peni Parker',
        'peni@spiderverse.com',
        '(567) 890-1234'
    ),
    (
        '67890123456',
        'Spider-Ham',
        'ham@spiderverse.com',
        '(678) 901-2345'
    ),
    (
        '78901234567',
        'Aunt May',
        'may@spiderverse.com',
        '(789) 012-3456'
    ),
    (
        '89012345678',
        'Spider-Man 2099',
        '2099@spiderverse.com',
        '(890) 123-4567'
    ),
    (
        '90123456789',
        'Prowler',
        'prowler@spiderverse.com',
        '(901) 234-5678'
    ),
    (
        '01234567890',
        'Doctor Octopus',
        'octopus@spiderverse.com',
        '(012) 345-6789'
    );

INSERT INTO
    client_adress (
        client_id,
        street,
        bairro,
        num,
        uf,
        compl,
        city,
        ref_point,
        nickname
    )
VALUES
    (
        1,
        'Rua do Aranha, 123',
        'Brooklyn',
        '345',
        'SP',
        'Apt 2B',
        'São Paulo',
        'Próximo ao Parque do Ibirapuera',
        'Morales Residence'
    ),
    (
        2,
        'Avenida das Quebras, 456',
        'Queens',
        '678',
        'RJ',
        'Apt 5C',
        'Rio de Janeiro',
        'Próximo ao Cristo Redentor',
        'Parker Apartment'
    ),
    (
        3,
        'Rua das Teias, 789',
        'Midtown',
        '910',
        'PR',
        'Apt 7D',
        'Curitiba',
        'Próximo ao Jardim Botânico',
        'Stacy Residence'
    ),
    (
        4,
        'Rua das Sombras, 111',
        'Downtown',
        '1213',
        'BA',
        'Apt 9F',
        'Salvador',
        'Próximo ao Pelourinho',
        'Noir Hideout'
    ),
    (
        5,
        'Avenida Tecnológica, 222',
        'High-Tech District',
        '1415',
        'SC',
        'Apt 11G',
        'Florianópolis',
        'Próximo à Universidade',
        'Parker Tech Residence'
    ),
    (
        6,
        'Rua Engraçada, 333',
        'Funnyville',
        '1617',
        'RS',
        'Apt 13J',
        'Porto Alegre',
        'Próximo ao Parque da Redenção',
        'Ham Residence'
    ),
    (
        7,
        'Avenida dos Doces, 444',
        'Sweetsville',
        '1819',
        'MG',
        'Casa 15',
        'Belo Horizonte',
        'Próximo à Praça da Liberdade',
        'May Residence'
    ),
    (
        8,
        'Avenida Futurista, 555',
        'Future District',
        '2021',
        'DF',
        'Apt 17L',
        'Brasília',
        'Próximo à Esplanada dos Ministérios',
        '2099 Residence'
    ),
    (
        9,
        'Rua das Sombras, 666',
        'Underground',
        '2324',
        'PE',
        'Apt 19N',
        'Recife',
        'Próximo ao Marco Zero',
        'Prowler Hideout'
    ),
    (
        10,
        'Avenida dos Experimentos, 777',
        'Lab District',
        '2526',
        'SP',
        'Apt 21P',
        'São Paulo',
        'Próximo ao Instituto de Pesquisas',
        'Octopus Laboratory'
    ),
    (
        1,
        'Rua dos Amigos, 888',
        'Harlem',
        '2728',
        'NY',
        'Casa 23',
        'Nova York',
        'Próximo à Escola',
        'Miles Dormitory'
    ),
    (
        1,
        'Avenida da Justiça, 999',
        'Hero District',
        '2930',
        'NY',
        'Casa 25',
        'Nova York',
        'Próximo à Sede dos Vingadores',
        'Miles Hero Residence'
    ),
    (
        2,
        'Rua dos Sonhos, 101',
        'Dreamland',
        '3132',
        'NY',
        'Casa 27',
        'Nova York',
        'Próximo ao Central Park',
        'Peter Dream Residence'
    ),
    (
        2,
        'Avenida dos Clones, 121',
        'Clone District',
        '3334',
        'NY',
        'Casa 29',
        'Nova York',
        'Próximo ao Laboratório',
        'Parker Clone Hideout'
    ),
    (
        3,
        'Rua das Artes, 141',
        'Art District',
        '3536',
        'NY',
        'Casa 31',
        'Nova York',
        'Próximo ao Museu',
        'Gwen Art Residence'
    ),
    (
        3,
        'Avenida das Cores, 161',
        'Colorful Street',
        '3738',
        'NY',
        'Casa 33',
        'Nova York',
        'Próximo ao Estúdio de Arte',
        'Stacy Colorful Hideout'
    );

INSERT INTO
    client_card (
        pm_id,
        client_id,
        nickname,
        number,
        cpf,
        titular,
        cvv,
        cnpj
    )
VALUES
    (
        2,
        1,
        'Cartão Miles',
        '1111222233334444',
        '12345678901',
        'Miles Morales',
        '123',
        null
    ),
    (
        3,
        2,
        'Cartão Peter',
        '2222333344445555',
        '23456789012',
        'Peter B. Parker',
        '456',
        null
    ),
    (
        2,
        3,
        'Cartão Gwen',
        '3333444455556666',
        '34567890123',
        'Gwen Stacy',
        '789',
        null
    ),
    (
        3,
        4,
        'Cartão Noir',
        '4444555566667777',
        '45678901234',
        'Spider-Man Noir',
        '012',
        null
    ),
    (
        2,
        5,
        'Cartão Peni',
        '5555666677778888',
        '56789012345',
        'Peni Parker',
        '345',
        null
    ),
    (
        3,
        6,
        'Cartão Ham',
        '6666777788889999',
        '67890123456',
        'Spider-Ham',
        '678',
        null
    ),
    (
        2,
        7,
        'Cartão Aunt May',
        '7777888899990000',
        '78901234567',
        'Aunt May',
        '901',
        null
    ),
    (
        3,
        8,
        'Cartão 2099',
        '8888999900001111',
        '89012345678',
        'Spider-Man 2099',
        '234',
        null
    ),
    (
        2,
        9,
        'Cartão Prowler',
        '9999000011112222',
        '90123456789',
        'Prowler',
        '567',
        null
    ),
    (
        3,
        10,
        'Cartão Octopus',
        '0000111122223333',
        '01234567890',
        'Doctor Octopus',
        '890',
        null
    );

INSERT INTO
    deliveryman (
        cpf,
        rg,
        cnh,
        name,
        email,
        city,
        uf,
        agency_number,
        account_number
    )
VALUES
    -- Deliveryman 'Neymar Jr'
    (
        '11111111111',
        '12345678',
        'A123456789',
        'Neymar Jr',
        'neymar@example.com',
        'Santos',
        'SP',
        '1234',
        '567890'
    ),
    -- Deliveryman 'Gabriel Jesus'
    (
        '22222222222',
        '23456789',
        'B987654321',
        'Gabriel Jesus',
        'gabriel@example.com',
        'São Paulo',
        'SP',
        '5678',
        '123456'
    ),
    -- Deliveryman 'Marcelo'
    (
        '33333333333',
        '34567890',
        'C987654321',
        'Marcelo',
        'marcelo@example.com',
        'Rio de Janeiro',
        'RJ',
        '9012',
        '345678'
    ),
    -- Deliveryman 'Alisson Becker'
    (
        '44444444444',
        '45678901',
        'D123456789',
        'Alisson Becker',
        'alisson@example.com',
        'Porto Alegre',
        'RS',
        '3456',
        '789012'
    ),
    -- Deliveryman 'Roberto Firmino'
    (
        '55555555555',
        '56789012',
        'E987654321',
        'Roberto Firmino',
        'firmino@example.com',
        'Maceió',
        'AL',
        '7890',
        '123456'
    ),
    -- Deliveryman 'Dani Alves'
    (
        '66666666666',
        '67890123',
        'F123456789',
        'Dani Alves',
        'danialves@example.com',
        'Juazeiro',
        'BA',
        '2345',
        '678901'
    ),
    -- Deliveryman 'Philippe Coutinho'
    (
        '77777777777',
        '78901234',
        'G987654321',
        'Philippe Coutinho',
        'coutinho@example.com',
        'Rio de Janeiro',
        'RJ',
        '6789',
        '234567'
    ),
    -- Deliveryman 'Casemiro'
    (
        '88888888888',
        '89012345',
        'H123456789',
        'Casemiro',
        'casemiro@example.com',
        'São José dos Campos',
        'SP',
        '1234',
        '567890'
    ),
    -- Deliveryman 'David Luiz'
    (
        '99999999999',
        '90123456',
        'I987654321',
        'David Luiz',
        'davidluiz@example.com',
        'Salvador',
        'BA',
        '5678',
        '123456'
    ),
    -- Deliveryman 'Gabriel Barbosa'
    (
        '00000000000',
        '01234567',
        'J123456789',
        'Gabriel Barbosa',
        'gabigol@example.com',
        'Rio de Janeiro',
        'RJ',
        '9012',
        '345678'
    );

INSERT INTO
    orders (
        dm_id,
        rest_id,
        cli_adr_id,
        pm_id,
        date_time,
        delivery_price
    )
VALUES
    (2, 1, 4, 2, '2023-06-19 23:40:21', 5.99),
    (3, 2, 2, 2, '2021-02-22 18:30:00', 5.99),
    (4, 5, 1, 1, '2023-04-22 18:30:00', 7.00),
    (6, 7, 4, 3, '2023-04-22 18:30:00', 7.00),
    (7, 3, 1, 3, '2022-04-12 19:34:00', 0.00),
    (8, 6, 6, 3, '2022-12-12 23:34:00', 0.00),
    (1, 9, 7, 1, '2022-07-22 13:34:00', 0.00),
    (5, 10, 3, 2, '2018-09-23 16:34:00', 2.00),
    (9, 4, 8, 4, '2020-02-22 16:44:00', 3.00),
    (10, 8, 9, 4, '2022-12-22 14:14:00', 10.00),
    (7, 4, 3, 3, '2023-10-13 20:12:10', 11.00);

INSERT INTO
    order_item (order_id, item_id, qntd)
VALUES
    (1, 1, 2),
    (1, 3, 1),
    (2, 2, 3),
    (2, 4, 2),
    (3, 5, 1),
    (3, 7, 2),
    (4, 6, 2),
    (4, 8, 1),
    (5, 9, 3),
    (6, 10, 2),
    (7, 11, 1),
    (7, 13, 2),
    (8, 12, 2),
    (9, 14, 1),
    (10, 15, 2),
    (11, 7, 2),
    (11, 8, 2);
