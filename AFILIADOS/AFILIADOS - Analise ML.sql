-- Esta query procura todos os pedidos da loja virtual que sejam ML e que não tenham
-- chave de licença vinculada ao item.
select
	Pedido.Id AS CodigoPedLV 
	, Pedido.CodigoML
	, Pedido.CodigoERP
	, Pedido.DataInclusao
	, PedidoStatus.Nome AS Status
	, ProdutoLicenca.Chave
	, PedidoItem.Quantidade
	, PedidoItem.Nome
	, PedidoItem.Valor
	-- , * 
from SQL_AXYSWEB.ECommerceAfiliados.dbo.Pedido
JOIN SQL_AXYSWEB.ECommerceAfiliados.dbo.PedidoItem on Pedido.id = PedidoItem.IdPedido
JOIN SQL_AXYSWEB.ECommerceAfiliados.dbo.PedidoStatus on PedidoStatus.id = Pedido.IdPedidoStatus
LEFT JOIN SQL_AXYSWEB.ECommerceAfiliados.dbo.ProdutoLicenca on PedidoItem.id = ProdutoLicenca.IdPedidoItem
WHERE CodigoML IS NOT NULL
	AND IdPedidoStatus <> 5
	AND Chave IS NULL
ORDER BY Pedido.DataInclusao Desc;

-- Licenca que esta no pedido do mercado livre e não esta na loja virtual
select * from SQL_AXYSWEB.ECommerceAfiliados.dbo.ProdutoLicenca
WHere Chave = 'HD8VJ-QY79M-Y5QQV-M9DTB';

-- Esta query é a mesma da de cima porem procura por item do mercado livre.
select
	Pedido.Id AS CodigoPedLV 
	, Pedido.CodigoML
	, Pedido.CodigoERP
	, Pedido.DataInclusao
	, PedidoStatus.Nome AS Status
	, ProdutoLicenca.Chave
	, PedidoItem.Quantidade
	, PedidoItem.Nome
	, PedidoItem.Valor
	, PedidoItem.Id
	-- , * 
from SQL_AXYSWEB.ECommerceAfiliados.dbo.Pedido
JOIN SQL_AXYSWEB.ECommerceAfiliados.dbo.PedidoItem on Pedido.id = PedidoItem.IdPedido
JOIN SQL_AXYSWEB.ECommerceAfiliados.dbo.PedidoStatus on PedidoStatus.id = Pedido.IdPedidoStatus
LEFT JOIN SQL_AXYSWEB.ECommerceAfiliados.dbo.ProdutoLicenca on PedidoItem.id = ProdutoLicenca.IdPedidoItem
WHERE CodigoML = '1840994704'
	AND IdPedidoStatus <> 5
	-- AND Chave IS NULL
ORDER BY Pedido.DataInclusao Desc;

--UPDATE SQL_AXYSWEB.ECommerceAfiliados.dbo.ProdutoLicenca SET IdPedidoItem = NULL
--WHERE chave = 'E1FVH-XKKNQ-N2VS6-A6F2D';

-- Este update atualiza a chave em um pedido especifico, lembrando que o vinculo
-- fica no item do pedido onde ele vincula na tabela ProdutoLicenca.
UPDATE SQL_AXYSWEB.ECommerceAfiliados.dbo.ProdutoLicenca SET IdPedidoItem = 10126
WHERE Chave = 'HD8VJ-QY79M-Y5QQV-M9DTB';

-- Procura um Produto por chave.
select * from SQL_AXYSWEB.ECommerceAfiliados.dbo.ProdutoLicenca
WHere Chave = 'E1FVH-XKKNQ-N2VS6-A6F2D';

-- Procura muitos Produtos por chave.
select * from SQL_AXYSWEB.ECommerceAfiliados.dbo.ProdutoLicenca
WHere Chave in ('FPRR8-3HYNR-HQUYJ-Y9GH9',
'FZZE9-VZ726-SN39E-CSGJS',
'GD839-PJ71Y-BP2TM-YWMFW',
'H7NWK-GT29Q-HV2S4-GF1Y3',
'H9PGK-ZPDEQ-K54MW-SZ6RG',
'HHMHQ-UMH8C-MTZKT-WFM31',
'HTR5M-CX338-P19WH-RDC6G',
'JMES9-6KRQ6-TGT2Y-M8J39',
'JN76H-FF64H-NQXW1-A1A24',
'JY9E2-1Q8XM-9JP6V-TWCFX',
'KEUSN-BPN2H-93SVF-NZNCX',
'KHK3U-7G44R-RNKUA-K3ACZ',
'KS9Z4-N1H7D-BBJB7-6X9GP',
'KURF7-BM55K-BM2TB-PAN6G',
'M9G39-3KV9M-1D43P-R1ZPB',
'MJQR3-RBE4J-WUGJ1-3BS15',
'NZCQ6-HZWU6-JNJX3-8FADM',
'P4BD1-8U457-6EDG3-PHUHV',
'PHDXF-DPB7K-6RWEY-85C1G',
'PK9Q4-SRUWG-ZNENW-Y1BPF',
'PNF72-T1VNF-85F9Q-N5ZJQ',
'PY5B4-ZYQ1K-A685R-7QVCD',
'QGVSA-9NYQC-B9923-DM22J',
'QUZJN-ECB96-8BF7K-YZYUB',
'RRT6S-PYBES-J42FZ-N433B',
'S77ZA-CM293-5T4RY-A5XNG',
'S96CD-RMHXU-SUP92-C1AHW',
'SF8MH-CT57Y-25R31-K4C2S',
'SQEVG-YTJ7A-9NUJ1-46DGG',
'T4F1T-Z62KR-P8C28-YMSFB')

select * from SQL_AXYSWEB.ECommerceAfiliados.dbo.ProdutoML

-- Procura por produto levando em consideração a data de inclusão do item no estoque.
-- Lembrando que quando utilizamos uma licenca o sistema esta mudando tambem a data de inclusão e
-- não somente a data de alteração do produto.
select IdProdutoOpcao, DescricaoComercial, COUNT(*) from SQL_AXYSWEB.ECommerceAfiliados.dbo.ProdutoLicenca
join SQL_AXYSWEB.ECommerceAfiliados.dbo.ProdutoOpcao on ProdutoOpcao.id = ProdutoLicenca.IdProdutoOpcao
Where DataInclusao between  '2018-11-05 00:00:00' and '2018-11-05 23:59:59'
group by IdProdutoOpcao, DescricaoComercial

select IdProdutoOpcao, DescricaoComercial, Chave from SQL_AXYSWEB.ECommerceAfiliados.dbo.ProdutoLicenca
join SQL_AXYSWEB.ECommerceAfiliados.dbo.ProdutoOpcao on ProdutoOpcao.id = ProdutoLicenca.IdProdutoOpcao
Where DataInclusao between  '2018-11-05 00:00:00' and '2018-11-05 23:59:59'
	AND idProdutoOpcao = 62
group by IdProdutoOpcao, DescricaoComercial

where chave like '%HD8VJ%'

SELECT * FROM SQL_AXYSWEB.ECommerceAfiliados.dbo.ProdutoOpcao