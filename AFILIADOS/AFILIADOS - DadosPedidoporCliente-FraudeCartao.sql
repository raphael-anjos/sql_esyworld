SELECT Id, IdAfiliado, IdCliente, IdPedidoStatus, DataInclusao, ValorTotal, DataFinalizacao, ValorDescontoCupom, 
Nome, Email, Cpf, Rg, Telefone, Celular, Entrega_Titulo, Entrega_Rua, Entrega_Numero, Entrega_Complemento, 
Entrega_Bairro, Entrega_Cep, Entrega_Cidade, Entrega_Estado, IdFormaPagamento, NumeroParcelas, PagamentoTid, 
PagamentoLr, PagamentoArp, PagamentoPan, PagamentoNSU, ValorParcela, CodigoERP, ValorTotalParcelado
FROM Pedido
WHERE idcliente = 14121 AND pagamentopan IS NOT NULL 
AND  pagamentoNSU IS NOT NULL 
AND  IdPedidoStatus = 6;

SELECT sts.Id, sts.Nome, COUNT(ped.id)
FROM Pedido AS ped LEFT JOIN PedidoStatus AS sts
ON ped.IdPedidoStatus = sts.Id
WHERE ped.idcliente = 14121 AND ped.pagamentopan IS NOT NULL 
AND  ped.pagamentoNSU IS NOT NULL 
GROUP BY sts.Id, sts.Nome;


SELECT * FROM PedidoItem
WHERE idPedido IN (SELECT Id FROM Pedido 
WHERE idcliente = 14121 AND pagamentopan IS NOT NULL 
AND idPedido = 911660
AND  pagamentoNSU IS NOT NULL AND  IdPedidoStatus = 6) 

SELECT * 
FROM ProdutoLicenca
WHERE IdPedidoItem = 26036

/*Caso da Fraude Cartão de Crédito - 2022-05-03*/
SELECT ped.Id AS [PedidoLoja], ped.CodigoERP AS [Pedido UNO], prod.Codigo, prod.DescricaoComercial, item.Quantidade,lic.Chave, 
ped.IdAfiliado, ped.IdCliente, ped.IdPedidoStatus, sts.Nome, ped.DataInclusao, ped.ValorTotal, ped.DataFinalizacao, ped.ValorDescontoCupom, ped.
Nome, ped.Email, ped.Cpf, ped.Rg, ped.Telefone, ped.Celular, ped.Entrega_Titulo, ped.Entrega_Rua, ped.Entrega_Numero, ped.Entrega_Complemento, ped.
Entrega_Bairro, ped.Entrega_Cep, ped.Entrega_Cidade, ped.Entrega_Estado, ped.IdFormaPagamento, ped.NumeroParcelas, ped.PagamentoTid, ped.
PagamentoLr, ped.PagamentoArp, ped.PagamentoPan, ped.PagamentoNSU, ped.ValorTotalParcelado
FROM PedidoStatus AS sts LEFT JOIN Pedido AS ped
ON sts.id = ped.IdPedidoStatus
LEFT JOIN PedidoItem AS item
ON item.IdPedido = ped.Id
LEFT JOIN ProdutoLicenca AS lic
ON lic.IdPedidoItem = item.Id
LEFT JOIN ProdutoOpcao AS prod
ON lic.IdProdutoOpcao = prod.Id
WHERE ped.idcliente = 14121 AND ped.pagamentopan IS NOT NULL 
AND  ped.pagamentoNSU IS NOT NULL 
AND  ped.IdPedidoStatus = 6;