SET @ano =  YEAR(CURDATE());
SELECT 
	ped.cod_pedido AS 'Codigo Pedido',
	servico.cod_plano AS 'Codigo Plano',
    ped.cod_oportunidade 'Oportunidade',
	itemNf.cod_produto AS 'SKU',
	familia_comercial.cod_familia_comercial AS 'Familia Comercial',
	ped.cod_revenda AS 'Codigo Revenda',
    ped.cod_colaborador AS 'Codigo Vendedor',
    servico.cod_colaborador AS 'Vendedor Plano',
    cli.cod_colaborador_revenda AS 'Revenda Plano',
    servico.nome_cliente AS 'Nome Revenda Plano',
    nf.dt_emissao AS 'Data Pedido',
	nf.nr_nota_fiscal AS 'Nota',
    nf.serie as 'Serie',
    itemNf.qtd AS 'Quantidade',
	ROUND(itemNf.preco_venda_original,2) AS 'Valor Revenda',
	ROUND((itemNf.qtd * itemNf.preco_venda_original),2) AS 'Total Revenda',
	nf.sigla_uf AS 'Estado',
	nf.cidade AS 'Cidade'
				
FROM
vd_nota_fiscal_item AS itemNf
LEFT JOIN vd_nota_fiscal AS nf
ON itemNf.cod_nota_fiscal = nf.cod_nota_fiscal
LEFT JOIN vd_pedido_item AS item
ON item.cod_pedido = itemNf.cod_pedido AND item.nr_sequencia = itemNf.nr_sequencia
LEFT JOIN vd_pedido AS ped ON ped.cod_pedido = itemNf.cod_pedido
LEFT JOIN cd_nop ON cd_nop.nop = nf.nop
LEFT JOIN cd_produto AS prod ON prod.cod_produto = itemNf.cod_produto
LEFT JOIN cd_familia_comercial AS familia_comercial ON familia_comercial.cod_familia_comercial = prod.cod_familia_comercial
LEFT JOIN sv_plano_servico AS servico ON servico.cod_plano = nf.cod_plano
LEFT JOIN cd_cliente AS cli ON cli.cod_cliente = servico.cod_cliente
WHERE YEAR(nf.dt_emissao) >= @ano-1 AND nf.cod_empresa IN (1)  AND nf.situacao < 200 AND nf.situacao IN ( 80,70,85 ) AND cd_nop.ind_estatistica_venda = 1