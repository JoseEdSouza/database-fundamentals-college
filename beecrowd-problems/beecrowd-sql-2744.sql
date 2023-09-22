--https://www.beecrowd.com.br/judge/pt/problems/view/2744
select
    id,
    password,
    MD5(password) as MD5
from
    account;