SET @ano =  YEAR(CURDATE());
SELECT 
	comissao.cod_pedido AS 'Codigo Pedido',
    nf.dt_emissao AS 'Data Pedido',
    itemNf.cod_produto AS 'SKU',
    familia_comercial.cod_familia_comercial AS 'Cod.Familia Comercial',
	comissao.cod_colaborador AS 'Cod.Vendedor',
	cad_revenda.nome_colaborador AS 'Nome Vendedor',
	comissao.perc_participacao AS '% Participacao Pedido',
	nop.ind_suframa AS 'Suframa',
	nop.ind_tributacao_icms AS 'Tributa ICMS',
	itemNf.aliquota_icms AS 'Aliquota ICMS',
	itemNf.qtd AS 'Quantidade',
	itemNf.preco_venda_original AS 'Valor Revenda'
		
				 
FROM
vd_nota_fiscal_item AS itemNf
LEFT JOIN vd_nota_fiscal AS nf
ON itemNf.cod_nota_fiscal = nf.cod_nota_fiscal
JOIN vd_pedido AS ped ON ped.cod_pedido = itemNf.cod_pedido
JOIN vd_pedido_comissao AS comissao ON comissao.cod_pedido = ped.cod_pedido 
JOIN cd_nop AS nop ON nop.nop = nf.nop
JOIN sg_colaborador AS cad_revenda ON cad_revenda.cod_colaborador = comissao.cod_colaborador
JOIN cd_produto AS prod ON prod.cod_produto = itemNf.cod_produto
JOIN cd_familia_comercial AS familia_comercial ON familia_comercial.cod_familia_comercial = prod.cod_familia_comercial
WHERE YEAR(nf.dt_emissao) >= @ano-1 AND nf.situacao <> 200 AND nf.ind_estatistica_venda = 1 AND comissao.tp_owner = 1 AND comissao.perc_participacao <= 1.0