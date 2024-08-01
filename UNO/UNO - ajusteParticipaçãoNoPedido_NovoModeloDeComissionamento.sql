/*Data 26/07/2017
Objetivo: Ajustar a percentual de participação dos participantes nas vendas com situação ainda
em aberto ou seje de pedidos não finalizados por faturamento e ou Cancelamento
*/

start transaction;
update vd_pedido_comissao as comiss join vd_pedido as ped
on comiss.cod_pedido = ped.cod_pedido
set comiss.perc_participacao = 1
where ped.cod_empresa = 1 and comiss.perc_participacao is null and ped.situacao not in (70,80,90,200);
commit;
rollback;

#Retorna dados de pedidos com situção de ainda não finalizado.
select comiss.cod_pedido, ped.cod_pedido, comiss.cod_colaborador,comiss.perc_participacao
from vd_pedido_comissao as comiss join vd_pedido as ped
on comiss.cod_pedido = ped.cod_pedido
where ped.cod_empresa = 1 and ped.situacao not in (70,80,90,200);