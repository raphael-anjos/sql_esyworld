/*Data: 2018-03-22
Objetivo: Retornar os pedidos existentes na loja originadas do Mercado Livre
Solicitante: Bruna Carvalho (Financeiro)
*/
SELECT ped.ID AS [Pedido Loja], ped.codigoERP as [Pedido Uno], 
ped.CodigoML as [Pedido ML], ped.datafinalizacao as [Data Finalização], 
ped.valortotal as [Total Pedido], sts.Nome as [Status Pedido]
FROM PedidoStatus AS sts JOIN Pedido as ped
ON sts.Id = ped.IdPedidoStatus
WHERE IDafiliado = 183