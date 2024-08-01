SELECT cod_colaborador, sigla_uf, cod_regiao
FROM sg_colaborador
WHERE sigla_uf IN () 

select cod_cliente, cod_revenda_gerado
where cod_cliente = 107903

select cli.cod_cliente, cli.nome_cliente ,cli.cod_regiao,cli.cod_revenda_gerado, end.sigla_uf
from cd_cliente as cli join cd_cliente_endereco as end
on cli.cod_cliente = end.cod_cliente
where cli.cod_revenda_gerado is not null and cli.cod_revenda_gerado > 0 and end.sigla_uf in (
'MT','MS','GO','DF','TO') 


UPDATE cd_cliente
SET cod_regiao = 3
WHERE cod_cliente in (9771,33585,42202,45925,93205,94399,97763,97814,98358,100219,37037,45641,93308,95167)