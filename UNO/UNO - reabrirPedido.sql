
/*Este script é utilizado para raealizar a abertura de um pedido que apresentou erro no momento do faturamento
porém mesmo alterando a situação do mesmo, sempre volta para situação de Faturado sem um número de nota vinculado ao mesmo.
*/
set @pedido = 160139;

delete from vd_pedido_item_aberto where cod_pedido in (@pedido);
update vd_pedido set situacao = 60 where cod_pedido in (@pedido);
update vd_pedido_item set situacao = 60, qtd_atendida = 0 where cod_pedido in (@pedido);

insert into vd_pedido_item_aberto (cod_empresa, prioridade, cod_produto, nr_sequencia, cod_pedido, dt_entrega_comprometida, dt_entrega_solicitada, situacao, qtd)
SELECT vd_pedido.cod_empresa, prioridade, cod_produto, nr_sequencia, vd_pedido.cod_pedido, dt_entrega_comprometida, dt_entrega_solicitada, vd_pedido.situacao, qtd - qtd_atendida as qtd
FROM   vd_pedido, vd_pedido_item
WHERE  vd_pedido.cod_pedido = vd_pedido_item.cod_pedido and
       vd_pedido.cod_empresa = vd_pedido_item.cod_empresa and
       vd_pedido.cod_pedido in (@pedido);

update vd_pedido_item_aberto, vd_pedido_item set vd_pedido_item_aberto.qtd = ( vd_pedido_item.qtd - vd_pedido_item.qtd_atendida ) 
WHERE vd_pedido_item_aberto.qtd <> ( vd_pedido_item.qtd - vd_pedido_item.qtd_atendida ) and vd_pedido_item_aberto.cod_empresa = vd_pedido_item.cod_empresa AND 
vd_pedido_item_aberto.cod_pedido = vd_pedido_item.cod_pedido AND vd_pedido_item_aberto.nr_sequencia = vd_pedido_item.nr_sequencia AND vd_pedido_item.cod_pedido in (@pedido)