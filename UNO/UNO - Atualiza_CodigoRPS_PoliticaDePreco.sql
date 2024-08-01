select cod_produto, cod_produto_rps, ind_politica_preco
from cd_produto
where  cod_produto in ('BBSi190a-h','BBSi1090a-b','BBSi1090a-dc','BBSi1090a-e','BBSi1090a-h');

select cod_produto, cod_produto_rps
from cd_produto_empresa
where  cod_produto in ('BBSi190a-h','BBSi1090a-b','BBSi1090a-dc','BBSi1090a-e','BBSi1090a-h');


START TRANSACTION;
UPDATE cd_produto_empresa
SET cod_produto_rps = '02800'
WHERE cod_produto IN ('BBSi190a-h','BBSi1090a-b','BBSi1090a-dc','BBSi1090a-e','BBSi1090a-h');

START TRANSACTION;
UPDATE cd_produto
SET cod_produto_rps = '02800', ind_politica_preco = 1
WHERE cod_produto IN ('BBSi190a-h','BBSi1090a-b','BBSi1090a-dc','BBSi1090a-e','BBSi1090a-h');
