/*
Status de Pedido
1:Cesta de Compras
2:Aguardando Pagamento
3:Pagamento Aprovado
4:Finalizado
5:Cancelado
6:Download Liberado
*/
begin transaction;

update pedido
set idPedidoStatus = 6
where id = 530080;

rollback;
commit;