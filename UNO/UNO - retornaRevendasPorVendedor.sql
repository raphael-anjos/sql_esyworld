/*Retorna revendas do vendedor especifico*/
set @cod_vendedor = 4244;
select cod_cliente,nome_cliente, razao_social
from cd_cliente
where cod_colaborador = @cod_vendedor and cod_revenda_gerado is not null;