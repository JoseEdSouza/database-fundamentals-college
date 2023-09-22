--https://www.beecrowd.com.br/judge/pt/problems/view/2625
SELECT
    SUBSTRING(cpf, 1, 3) || '.' || SUBSTRING(cpf, 4, 3) || '.' || SUBSTRING(cpf, 7, 3) || '-' || SUBSTRING(cpf, 10, 2) AS CPF
FROM
    natural_person;