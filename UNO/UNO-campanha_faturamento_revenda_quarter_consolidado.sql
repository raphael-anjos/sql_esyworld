SET @ano =  YEAR(CURDATE());
SELECT 
	cli.cod_cliente AS 'Codigo Cliente',
	rev.cod_colaborador AS 'Codigo Revenda',
	rev.nome_colaborador AS 'Revenda',
	cli.tb_preco AS 'Tabela de Preço',
	SUBSTRING(item.cod_produto, 1, 6) AS 'Produto',
	item.desc_comercial AS 'Nome Produto',
	sum(ROUND((itemNf.qtd * itemNf.preco_venda_original),2)) AS 'Faturamento'
				
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
LEFT JOIN sg_colaborador AS rev ON rev.cod_colaborador = ped.cod_revenda
LEFT JOIN cd_cliente AS cli ON cli.cod_revenda_gerado = rev.cod_colaborador
LEFT JOIN cd_cliente_atividade AS qualifica ON qualifica.cod_cliente = cli.cod_cliente
LEFT JOIN cd_ramo_atividade AS tb_qualificacao ON tb_qualificacao.cod_ramo_atividade = qualifica.cod_ramo_atividade
WHERE nf.dt_emissao BETWEEN '2024-04-01' AND '2024-06-28' AND nf.cod_empresa IN (1)  AND nf.situacao < 200 AND nf.situacao IN ( 80,70,85 ) AND cd_nop.ind_estatistica_venda = 1 AND cli.cod_revenda_gerado > 0 AND familia_comercial.cod_familia_comercial = 15 AND tb_qualificacao.desc_abrev LIKE 'KASP%_%'
GROUP BY Produto,Revenda
HAVING Faturamento >= 15000
ORDER BY Revenda