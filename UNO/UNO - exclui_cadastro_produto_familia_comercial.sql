/*Retorna todos os produtos do cadastro de produto empresa
por familia comercial*/
select *
from cd_produto_empresa
where cod_produto in (select cod_produto
							from cd_produto
							where cod_familia_comercial = 28);
/*Retorna todos os produtos do cadastro das tabelas de preço 
por familia comercial*/
select *
from cd_preco_item
where cod_produto in (select cod_produto
							from cd_produto
							where cod_familia_comercial = 28);
							
							
start transaction;
/*Apaga os registros a tabela produto empresa 
por familia comercial de produto*/
delete from cd_produto_empresa
where cod_produto in (select cod_produto
							from cd_produto
							where cod_familia_comercial = 28);
							
/*Apaga os registros em todas as tabelas de preço
 por familia comercial de produto*/
delete from cd_preco_item
where cod_produto in (select cod_produto
							from cd_produto
							where cod_familia_comercial = 28);							
rollback;
commit;							