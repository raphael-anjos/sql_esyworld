/*
select cod_cliente, nome_cliente, cnpj, insc_estadual
from cd_cliente
where insc_estadual like '%.%' or insc_estadual like '%/%' or insc_estadual like '%-%' 

update cd_cliente
set insc_estadual = replace(insc_estadual,'/','')

select cod_cliente, nome_cliente, cnpj, insc_estadual
from cd_cliente
where insc_estadual like '%-%'

update cd_cliente
set insc_estadual = replace(insc_estadual,'-','')

select cod_cliente, nome_cliente, cnpj, insc_estadual
from cd_cliente
where insc_estadual like '%.%'

update cd_cliente
set insc_estadual = replace(insc_estadual,'.','')

select cod_cliente, nome_cliente, cnpj, insc_estadual
from cd_cliente
where cnpj like '%.%' or cnpj like '%/%' or cnpj like '%-%' 

select cod_cliente, telefone
from cd_cliente_telefone
where telefone like '%.%' or telefone like '%/%' or telefone like '%-%' 

update cd_cliente_telefone
set telefone = replace(telefone,'-','');
*/

select cli.cod_cliente, cli.cod_revenda_gerado, colab.cod_colaborador, 
			capitalize (cli.razao_social), colab.nome_colaborador
from cd_cliente as cli, sg_colaborador as colab 
where cli.cod_revenda_gerado = colab.cod_colaborador

select * from fn_plano_conta
select * from fn_titulo_receber

update fn_titulo_receber
set conta = '001' , sub_conta = '0010'
where conta is null

select hora_acesso_inicial, hora_acesso_final
from sg_colaborador
where email like '%@esy.com.br' and situacao = 1

update sg_colaborador
set hora_acesso_inicial = '08:00:00' , hora_acesso_final = '19:00:00'
where email like '%@esy.com.br' and situacao = 1
hora_acesso_inicial = '08:00:00'
hora_acesso_final = '19:00:00'

select *
from cd_param_empresa
where cod_empresa = 1 and nome_param like '%conta%'

select sistema, label
from cd_parametro
where label like '%conta%'
order by 1

select * from at_oportunidade 
where cod_oportunidade in (4672,4673,4674,4675)

update at_oportunidade
set periodicidade = null
where tp_oportunidade = 2;

update at_oportunidade
set cod_fornecedor = 2
where cod_fornecedor is null;

update at_oportunidade 
set dt_fechamento = null
where cod_oportunidade in (4673,4674)

select * from at_oportunidade
where cod_status is null

select cod_status
from at_oportunidade 
where cod_oportunidade in (3830, 4673)

set @banco = 'db_uc_desenv';
set @coluna = 'cod_banco';
select table_schema as BancoDeDados,
			table_name as tabela,
			column_name as nomeColuna
			from information_schema.columns
			where table_schema = @banco
					and column_name = @coluna;
					
					
					
##2016-04-06
delete from at_oportunidade_arquivo;
delete from at_oportunidade_atributo;
delete from at_oportunidade_barreira;
delete from at_oportunidade_concorrente;
delete from at_oportunidade_hist;
delete from at_oportunidade_item;
delete from at_oportunidade_participante;
delete from at_oportunidade_qualificacao;
delete from at_oportunidade;

select * from vd_pedido ped
where ped.cod_oportunidade is not null

update vd_pedido
set cod_oportunidade = 0
where cod_oportunidade <> 0;

select * from at_oportunidade;


set @banco = 'db_uc_desenv';
set @coluna = 'cod_banco';
select table_schema as BancoDeDados,
			table_name as tabela,
			column_name as nomeColuna
			from information_schema.columns
			where table_schema = @banco
					and column_name = @coluna;
select cod_pedido, cod_banco
from vd_pedido			
where dt_implant between '2016-04-01' and '2016-04-06'and situacao <> 80 and cod_banco <> 343;



select cod_banco from vd_pedido
where cod_pedido = 83349