SET @ano =  YEAR(CURDATE());
SELECT 
		ped.cod_pedido AS 'Código Pedido',
		familia_comercial.cod_familia_comercial AS 'Familia Comercial',
		itemNf.preco_venda_original AS 'Valor Revenda',
		itemNf.qtd AS 'Quantidade',
		nf.dt_emissao AS 'Data Pedido'
		
FROM
vd_nota_fiscal_item AS itemNf
LEFT JOIN vd_nota_fiscal AS nf
ON itemNf.cod_nota_fiscal = nf.cod_nota_fiscal
JOIN vd_pedido AS ped ON ped.cod_pedido = itemNf.cod_pedido
JOIN cd_nop ON cd_nop.nop = nf.nop
JOIN sg_colaborador AS cad_revenda ON cad_revenda.cod_colaborador = nf.cod_revenda
JOIN cd_produto AS prod ON prod.cod_produto = itemNf.cod_produto
JOIN cd_familia_comercial AS familia_comercial ON familia_comercial.cod_familia_comercial = prod.cod_familia_comercial
WHERE YEAR(nf.dt_emissao) >= @ano-1 AND nf.situacao <> 200 AND cd_nop.ind_estatistica_venda = 1
