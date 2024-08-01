/*Data: 26/05/2017
Objetivo: Alterar o vendedor no pedido de Venda e na tabela responsavel por calculo de comissão,
utilizado este recurso pois o pedido encontra-se já faturado.
*/

set @colabOriginal = 4;
set @colabCorrigido = 16;
set @pedido = 93894;

start transaction;
update vd_pedido
set cod_colaborador = @colabCorrigido, 
	 cod_colaborador_implant = @colabCorrigido
where cod_pedido = @pedido;

start transaction;
update vd_pedido_comissao
set cod_colaborador = @colabCorrigido
where cod_pedido = @pedido 
	and cod_colaborador = @colabOriginal;

select cod_colaborador, cod_colaborador_implant 
from vd_pedido 
where cod_pedido = @pedido;

select cod_colaborador 
from vd_pedido_comissao 
where cod_pedido = @pedido;

commit;
commit;

rollback;
rollback;