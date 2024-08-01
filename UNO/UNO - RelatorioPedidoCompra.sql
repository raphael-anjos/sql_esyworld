SELECT 
	
	pedidoCompra.cod_pedido_compra AS 'Invoice Number',
	pedidoCompra.dt_pedido AS 'Invoice Date',
	itemCompra.nr_sequencia_cc AS 'Line Item',
	itemCompra.cod_produto AS 'Vendor PN',
	produto.desc_comercial AS 'Item Desc',
	itemCompra.qtd_pedida AS 'Item Qty',
	itemCompra.preco_unit AS 'Extd Disti Cost',
	revenda.razao_social AS 'Revenda Name',
	CONCAT(enderecoRevenda.endereco, ',', enderecoRevenda.numero) AS 'Address',
	enderecoRevenda.cidade AS 'City',
	enderecoRevenda.sigla_uf AS 'State',
	enderecoRevenda.cep AS 'Postal Code',
	enderecoRevenda.pais AS 'Country',
	contatoRevenda.email AS 'Email',
	ped.nome_cliente AS 'End User',
	cliente.cnpj AS 'CNPJ',
	concat(enderecoCliente.endereco, ',', enderecoCliente.numero) AS 'Endereço Cliente',
	enderecoCliente.cidade AS 'Cidade',
	enderecoCliente.sigla_uf AS 'Estado',
	enderecoCliente.cep AS 'CEP',
	enderecoCliente.pais AS 'País',
	ped.email_cliente AS 'Email Cliente',
	contatoCliente.nome_contato AS 'Contato Cliente',
	contatoCliente.email AS 'Email'
FROM cc_pedido AS pedidoCompra

LEFT JOIN cc_pedido_item AS itemCompra
ON itemCompra.cod_pedido_compra = pedidoCompra.cod_pedido_compra
LEFT JOIN vd_pedido AS ped
ON ped.cod_pedido = itemCompra.cod_pedido_venda

LEFT JOIN cd_cliente AS revenda 
ON revenda.cod_revenda_gerado = ped.cod_revenda AND revenda.cod_revenda_gerado > 0
LEFT JOIN cd_cliente AS cliente 
ON cliente.cod_cliente = ped.cod_cliente

LEFT JOIN cd_cliente_endereco AS enderecoRevenda
ON enderecoRevenda.cod_cliente = revenda.cod_cliente
LEFT JOIN cd_cliente_endereco AS enderecoCliente
ON enderecoCliente.cod_cliente = cliente.cod_cliente

LEFT JOIN cd_cliente_contato AS contatoRevenda 
ON contatoRevenda.cod_cliente  = revenda.cod_cliente
AND contatoRevenda.nome_contato = 'KORM' 
LEFT JOIN cd_cliente_contato AS contatoCliente
ON contatoCliente.cod_cliente  = cliente.cod_cliente

LEFT JOIN cd_produto AS produto
ON produto.cod_produto = itemCompra.cod_produto

WHERE pedidoCompra.dt_pedido BETWEEN CURRENT_DATE()-7 AND CURRENT_DATE() AND pedidoCompra.cod_fornecedor = 11945