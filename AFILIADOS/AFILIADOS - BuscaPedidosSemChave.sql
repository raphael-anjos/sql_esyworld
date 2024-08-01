-- Esta query procura todos os pedidos da loja virtual que sejam ML e que não tenham
-- chave de licença vinculada ao item.
select
	Pedido.Id AS CodigoPedLV 
	, Pedido.CodigoML
	, Pedido.CodigoERP
	, Pedido.DataInclusao
	, Afiliado.Id
	, Afiliado.RazaoSocial
	, Pedido.IdCliente
	, Cliente.Nome
	, Cliente.NomeRazaoSocial
	, Cliente.Email
	, PedidoStatus.Nome AS [Status]
	, ProdutoLicenca.Chave
	, PedidoItem.Quantidade
	, ProdutoOpcao.Codigo
	, ProdutoOpcao.DescricaoComercial
	, PedidoItem.Valor AS [Valor Unitário]
	, quantidade*pedidoItem.valor AS [Total]
	-- , * 
FROM  dbo.Pedido
JOIN dbo.PedidoItem ON Pedido.id = PedidoItem.IdPedido
JOIN Dbo.Afiliado ON Pedido.IdAfiliado = Afiliado.id
JOIN dbo.ProdutoOpcao ON ProdutoOpcao.Id = PedidoItem.IdProdutoOpcao
JOIN dbo.Cliente ON Cliente.Id = Pedido.IdCliente
JOIN dbo.PedidoStatus ON PedidoStatus.id = Pedido.IdPedidoStatus
LEFT JOIN dbo.ProdutoLicenca ON PedidoItem.id = ProdutoLicenca.IdPedidoItem
WHERE /*pedido.CodigoML IS NOT NULL
	AND IdPedidoStatus <> 5
	AND*/ Chave IS NULL
	AND IdPedidoStatus in (3,6)
ORDER BY Pedido.DataInclusao;