/*Data: 2018-08-02
CodigoErp : Recebe o numero do Pedido gerado no Uno.
Objetivo: Remover o valor de Frete no Pedido da loja para pedidos originados do Mercado Livre
Observação: Mesmo executando está rotina o valor não será alterado no pedido enviado ao ERP.
*/
select CodigoERP, ValorTotal, ValorFrete
from pedido
where CodigoERP = 115481;

update Pedido
set ValorTotal = (ValorTotal-ValorFrete), ValorFrete = 0
where CodigoERP = 115481;


removeFretePedidoLoja