## Situações de Clientes (0-Inativo,1-Ativo,2-Suspect,3-Prospect,9-Bloqueado,10-Cancelado)
## Situações do Colaborador (0 - Inativo,1 - Ativo, 2 - Férias, 3 - Afastado, 4 - Bloqueado, 5 - Demitido, 9 - Morte)
select cli.cod_revenda_gerado as 'Codigo Revenda', cli.cod_cliente as 'Codigo Cliente UNO', cli.nome_cliente as 'Nome do Cliente', 
case when cli.situacao = 0 then 'Inativo'
	when cli.situacao = 1 then 'Ativo'
	when cli.situacao = 2 then 'Suspect'
	when cli.situacao = 3 then 'Prospect'
	when cli.situacao = 9 then 'Bloqueado'
	when cli.situacao = 10 then 'Canceldo' else '????' end 'Situação Cliente',
colab.cod_colaborador as 'Código Claborador', colab.nome_colaborador as 'Nome Colaborador', 
case when colab.situacao = 0 then 'Inativo'
	when colab.situacao = 1 then 'Ativo'
	when colab.situacao = 2 then 'Férias'
	when colab.situacao = 3 then 'Afastado'
	when colab.situacao = 4 then 'Bloqueado'
	when colab.situacao = 5 then 'Demitido'
	when colab.situacao = 9 then 'Morte' else '????' end 'Situação Colaborador'

from cd_cliente as cli inner join sg_colaborador as colab
on cli.cod_colaborador = colab.cod_colaborador
where cli.cod_revenda_gerado > 0
order by colab.cod_colaborador
