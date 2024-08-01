select cod_cliente, nome_cliente, razao_social, cnpj, cod_revenda_gerado
from cd_cliente
where cod_revenda_gerado > 0 

select cli.cod_cliente as 'Codigo Cliente', cli.nome_cliente as 'Nome Cliente', cli.razao_social as 'Razao Social',
cli.cnpj as 'Cnpj', cli.cod_revenda_gerado as 'Codigo Revenda', colab.nome_colaborador as 'Nome Revenda'
from cd_cliente as cli join sg_colaborador as colab
on cli.cod_revenda_gerado = colab.cod_colaborador
where cli.cod_revenda_gerado > 0 

