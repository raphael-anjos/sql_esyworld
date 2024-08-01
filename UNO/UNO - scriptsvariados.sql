/*select *
from cd_produto
where cod_produto = 'KL4867KAWTC'

select *
from cd_preco_item
where cod_produto = 'KL4867KAWTC'

select * from sg_colaborador
where email like '%@esy.com.br' and situacao = 1

select * from sg_colaborador
where id_usuario like 'amaral%'

#4 - bloqueado
update sg_colaborador
set situacao = 4
where cod_colaborador not in (2784,3752,4650) and email like '%@esy.com.br' and situacao = 1

select * from cd_cliente where cod_cliente = 14213

select * from cd_preco_item
where tb_preco = 'REGISTRADA'
where cod_produto = 'KL4025KAUFM'

delete from cd_preco_item
where tb_preco = 'REGISTRADAS'

update cd_cliente
set insc_estadual = '000000000000'
where insc_estadual = ' ' or insc_estadual = 'isento' or insc_estadual is null ;

update cd_cliente
set insc_estadual = 'ISENTO'
where insc_estadual = '000000000000';

select cod_cliente, insc_estadual
from cd_cliente
where insc_estadual = ' ';

select cod_cliente, insc_estadual
from cd_cliente
where insc_estadual is null;

select cod_cliente, insc_estadual
from cd_cliente
where insc_estadual = 'ISENTO';

Gold e Silver
razão social
cidade

contato
telefone
email

select cli.cod_cliente, cli.razao_social, cli.tb_preco, cliend.cidade, cliend.sigla_uf
from cd_cliente as cli join cd_cliente_endereco as cliend
where cli.situacao = 1 and cli.cod_revenda_gerado > 0 and cli.tb_preco in ('silver','gold','platinum')
limit 0,350;


select cod_cliente, insc_estadual from cd_cliente
where insc_estadual like '%-%'

select cod_cliente, insc_estadual 
from cd_cliente
where insc_estadual like '%[.,-/cpf]%';

SELECT * FROM Customers
WHERE City LIKE '[a-c]%';


UPDATE cd_cliente 
SET insc_estadual = replace(insc_estadual,"-", "");

UPDATE cd_cliente 
SET insc_estadual = replace(insc_estadual,".", "");

UPDATE cd_cliente 
SET insc_estadual = replace(insc_estadual,"/", "");

select cod_cliente, insc_estadual 
from cd_cliente
where cod_cliente = 30;

select * 
from cd_preco_item
where tb_preco = 'ns'

delete from cd_preco_item
where tb_preco = 'ns'

update cd_preco_item
set qtd_min = 1
where tb_preco = 'ns'
*/

