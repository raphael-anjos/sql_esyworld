/*Data: 2018-09-05
Objetivo: Remover o valor do Frete no pedido da Loja
Onde passamos o numero do pedido Gerado no ERP.
Observação: Isso normalmente ocorre em pedidos originados do Mercado Livre*/

begin transaction;
update pedido
set ValorTotal = ValorTotal - ValorFrete , ValorFrete = 0
where CodigoERP = '116614'
commit;



