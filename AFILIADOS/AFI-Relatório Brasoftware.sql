/*

	Objetivo: Gerar um relatório de pedidos gerados em um intervalo entre o dia 05 do mês
	anterior e dia 04 do mês atual do afiliado Brasoftware. Este relatório contém dados que serão
	enviados para o afiliado e para financeiro, estando tudo correto será gerado um pedido no ERP
	para realizar o faturamento da relação de pedidos deste relatório.

*/

-- Declaração de variaveis
DECLARE @dataFinal Date
DECLARE @dataInicial Date

-- Atribuindo valor para as variaveis
SET @dataFinal = GETDATE()
SET @dataInicial = DATEADD(DAY, -1, DATEADD(MONTH, -1, GETDATE()))


SELECT 
	itemOpcao.SKUKorm as 'SKU',
	ped.CodigoERP AS 'Codigo. Erp',
	FORMAT(ped.DataInclusao, 'dd/MM/yyyy') AS 'Data do Pedido',
	ped.Nome AS 'Nome da Loja',
	itemOpcao.DescricaoComercial AS 'Itens do pedido',
	item.Quantidade AS 'Quant',
	precoOpcao.Valor AS 'Valor unitário',
	(precoOpcao.Valor * item.Quantidade) AS 'Valor total'
FROM Pedido AS ped

JOIN PedidoItem AS item ON item.IdPedido = ped.Id
JOIN ProdutoOpcao AS itemOpcao ON itemOpcao.Id = item.IdProdutoOpcao
JOIN ProdutoOpcaoPreco AS precoOpcao ON precoOpcao.IdProdutoOpcao = item.IdProdutoOpcao
WHERE ped.IdAfiliado = 325 
AND precoOpcao.IdTabelaPreco = 34
AND ped.DataInclusao BETWEEN @dataInicial  AND @dataFinal

