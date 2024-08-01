/*Data: 2020/02/18
Objetivo: Retorna dados do Pedido com base no PIN utilizado.
*/
use ECommerceAfiliados;
SELECT ped.Id as [PEDIDO LOJA],ped.CodigoERP AS [PEDIDO ERP] ,sts.Nome AS [STATUS ITEM] ,
PED.DataInclusao AS [DATA INCLUSÃO],req.PIN AS [N. PIN], req.FaceValue AS [VALOR UNIT],req.Serial AS [SERIAL INCOMM]

FROM pedidoStatus as sts JOIN pedido AS ped 
ON sts.Id = ped.IdPedidoStatus
JOIN pedidoitem AS pedit ON ped.id = pedit.idpedido
JOIN IncommRequisicao AS req ON pedit.Id = req.IdPedidoItem
WHERE ped.IdAfiliado = 49 AND req.PIN = 'V17011A7D23'
ORDER BY 1;
