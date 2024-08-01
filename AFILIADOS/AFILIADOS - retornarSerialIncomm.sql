/*Data: 2017/07/12
Objetivo: Realizar conferência SalesReport Incomm
*/
use ECommerceAfiliados;
SELECT ped.Id as [PEDIDO LOJA],ped.CodigoERP AS [PEDIDO ERP] ,sts.Nome AS [STATUS ITEM] ,
PED.DataInclusao AS [DATA INCLUSÃO],req.PIN AS [N. PIN], req.FaceValue AS [VALOR UNIT],req.Serial AS [SERIAL INCOMM]

FROM pedidoStatus as sts JOIN pedido AS ped 
ON sts.Id = ped.IdPedidoStatus
JOIN pedidoitem AS pedit ON ped.id = pedit.idpedido
JOIN IncommRequisicao AS req ON pedit.Id = req.IdPedidoItem

WHERE ped.IdAfiliado = 49 and ped.datainclusao <= '2017-11-30'
ORDER BY 1;
