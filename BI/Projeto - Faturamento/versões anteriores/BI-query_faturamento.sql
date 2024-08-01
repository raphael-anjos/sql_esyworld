#################################### PEDIDOS #####################################################################################################
SET @ano =  YEAR(CURDATE());
SELECT 
		ped.cod_pedido AS 'Código Pedido',
		nf.dt_emissao AS 'Data Pedido'			
FROM
vd_nota_fiscal_item AS itemNf
LEFT JOIN vd_nota_fiscal AS nf
ON itemNf.cod_nota_fiscal = nf.cod_nota_fiscal
JOIN vd_pedido AS ped ON ped.cod_pedido = itemNf.cod_pedido
JOIN cd_nop ON cd_nop.nop = nf.nop
WHERE YEAR(nf.dt_emissao) = @ano  AND nf.situacao <> 200 AND cd_nop.ind_estatistica_venda = 1
#####################################################################################################################################################

#################################### FATURAMENTO #####################################################################################################
SET @ano =  YEAR(CURDATE());
SELECT 
		ped.cod_pedido AS 'Código Pedido',
		ROUND(itemNf.qtd * itemNf.preco_venda_original),2) AS 'Faturamento'			
FROM
vd_nota_fiscal_item AS itemNf
LEFT JOIN vd_nota_fiscal AS nf
ON itemNf.cod_nota_fiscal = nf.cod_nota_fiscal
JOIN vd_pedido AS ped ON ped.cod_pedido = itemNf.cod_pedido
JOIN cd_nop ON cd_nop.nop = nf.nop
WHERE YEAR(nf.dt_emissao) = @ano  AND nf.situacao <> 200 AND cd_nop.ind_estatistica_venda = 1
#####################################################################################################################################################

#################################### FATURAMENTO POR ESTADOS ##################################################################################################
SET @ano =  YEAR(CURDATE());
SELECT 
		ped.cod_pedido AS 'Código Pedido',
		cad_revenda.sigla_uf AS 'Estado',
		cad_revenda.cidade AS 'Cidade',
		(itemNf.qtd * itemNf.preco_venda_original) AS 'Faturamento'
		
FROM
vd_nota_fiscal_item AS itemNf
LEFT JOIN vd_nota_fiscal AS nf
ON itemNf.cod_nota_fiscal = nf.cod_nota_fiscal
JOIN vd_pedido AS ped ON ped.cod_pedido = itemNf.cod_pedido
JOIN cd_nop ON cd_nop.nop = nf.nop
JOIN sg_colaborador AS cad_revenda ON cad_revenda.cod_colaborador = nf.cod_revenda
WHERE YEAR(nf.dt_emissao) = @ano AND nf.situacao <> 200 AND cd_nop.ind_estatistica_venda = 1

-- GROUP BY Estado
-- ORDER BY SUM(Faturamento) DESC
-- LIMIT 5 ;

#####################################################################################################################################################

#################################### TOP 5 REVENDAS ##################################################################################################
SET @ano =  YEAR(CURDATE());
SELECT 
		ped.cod_pedido AS 'Código Pedido',
		cad_revenda.nome_colaborador AS 'Revenda',
		CASE 
			WHEN nop.ind_tributacao_icms = 1 AND nop.ind_suframa = 1 THEN
				(itemNf.preco_venda_original * itemNf.qtd) - (itemNf.preco_venda_original * itemNf.qtd * itemNf.aliquota_icms) * comissao.perc_participacao
   		ELSE 
				(itemNf.preco_venda_original * itemNf.qtd) * comissao.perc_participacao 
		END AS 'Faturamento',
		nf.dt_emissao AS 'Data Pedido'
		
FROM
vd_nota_fiscal_item AS itemNf
LEFT JOIN vd_nota_fiscal AS nf
ON itemNf.cod_nota_fiscal = nf.cod_nota_fiscal
JOIN vd_pedido AS ped ON ped.cod_pedido = itemNf.cod_pedido
JOIN cd_nop AS nop ON nop.nop = nf.nop
JOIN vd_pedido_comissao AS comissao ON comissao.cod_pedido = ped.cod_pedido 
JOIN sg_colaborador AS cad_revenda ON cad_revenda.cod_colaborador = nf.cod_revenda
WHERE YEAR(nf.dt_emissao) = @ano-1 AND nf.situacao <> 200 AND nop.ind_estatistica_venda = 1 AND comissao.tp_owner	= 2
-- GROUP BY Revenda
-- ORDER BY SUM(Faturamento) DESC
-- LIMIT 5 ;

#####################################################################################################################################################


#################################### FATURAMENTO POR VENDEDORES ##################################################################################################
SET @ano =  YEAR(CURDATE());
SELECT 
		ped.cod_pedido AS 'Código Pedido',
		cad_revenda.nome_colaborador AS 'Vendedor',
		CASE 
			WHEN nop.ind_tributacao_icms = 1 AND nop.ind_suframa = 1 THEN
				(itemNf.preco_venda_original * itemNf.qtd) - (itemNf.preco_venda_original * itemNf.qtd * itemNf.aliquota_icms) * comissao.perc_participacao
   		ELSE 
				(itemNf.preco_venda_original * itemNf.qtd) * comissao.perc_participacao 
		END AS 'Faturamento',
		
				 
FROM
vd_nota_fiscal_item AS itemNf
LEFT JOIN vd_nota_fiscal AS nf
ON itemNf.cod_nota_fiscal = nf.cod_nota_fiscal
JOIN vd_pedido AS ped ON ped.cod_pedido = itemNf.cod_pedido
JOIN vd_pedido_comissao AS comissao ON comissao.cod_pedido = ped.cod_pedido 
JOIN cd_nop AS nop ON nop.nop = nf.nop
JOIN sg_colaborador AS cad_revenda ON cad_revenda.cod_colaborador = comissao.cod_colaborador
WHERE YEAR(nf.dt_emissao) = @ano AND nf.situacao <> 200 AND nf.ind_estatistica_venda = 1 AND comissao.tp_owner = 1 AND comissao.perc_participacao <= 1.0
GROUP BY Vendedor
ORDER BY SUM(Faturamento) DESC;
#####################################################################################################################################################

#################################### TOP 5 FAM.COMERCIAL ##################################################################################################
SET @mes =  MONTH(CURDATE());
SET @ano =  YEAR(CURDATE());
SELECT 
	familia_comercial,
	SUM(valor.Faturamento)
FROM
(SELECT 
		ped.cod_pedido AS 'Código Pedido',
		cd_familia_comercial.desc_abrev AS 'Familia Comercial',
		(itemNf.qtd * itemNf.preco_venda_original) AS 'Faturamento'
		
FROM
vd_nota_fiscal_item AS itemNf
LEFT JOIN vd_nota_fiscal AS nf
ON itemNf.cod_nota_fiscal = nf.cod_nota_fiscal
JOIN vd_pedido AS ped ON ped.cod_pedido = itemNf.cod_pedido
JOIN cd_nop ON cd_nop.nop = nf.nop
JOIN sg_colaborador AS cad_revenda ON cad_revenda.cod_colaborador = nf.cod_revenda
JOIN cd_produto AS prod ON prod.cod_produto = itemNf.cod_produto
JOIN cd_familia_comercial ON cd_familia_comercial.cod_familia_comercial = prod.cod_familia_comercial
WHERE YEAR(nf.dt_emissao) = @ano-1  AND MONTH(nf.dt_emissao )= @mes AND nf.situacao = 80 AND cd_nop.ind_estatistica_venda = 1) AS valor
GROUP BY familia_comercial
ORDER BY SUM(Faturamento) DESC
LIMIT 5 ;

#####################################################################################################################################################

#####################################TOP 5 PRODUTOS MAIS VENDIDOS####################################################################################
SET @mes =  MONTH(CURDATE());
SET @ano =  YEAR(CURDATE());
SELECT 
	ped.cod_pedido AS 'Código Pedido',
	prod.cod_produto AS 'SKU',
	prod.desc_comercial AS 'Produto'
	cd_familia_comercial.desc_abrev AS 'Familia Comercial'
	SUM(itemNf.qtd * itemNf.preco_venda_original) AS 'Faturamento'
	SUM(itemNf.qtd) AS 'Quantidade',
	nf.dt_emissao AS 'Data Pedido'
	
FROM
vd_nota_fiscal_item AS itemNf
LEFT JOIN vd_nota_fiscal AS nf
ON itemNf.cod_nota_fiscal = nf.cod_nota_fiscal
JOIN vd_pedido AS ped ON ped.cod_pedido = itemNf.cod_pedido
JOIN cd_produto AS prod ON prod.cod_produto = itemNf.cod_produto
JOIN cd_familia_comercial ON cd_familia_comercial.cod_familia_comercial = prod.cod_familia_comercial
WHERE YEAR(nf.dt_emissao) = @ano  
AND MONTH(nf.dt_emissao )= @mes-1 
AND nf.situacao = 80  
AND nf.ind_estatistica_venda = 1 
GROUP BY Produto
ORDER BY Quantidade DESC
LIMIT 5 ;
#####################################################################################################################################################

#####################################ULTIMAS NOTAS FATURADAS####################################################################################
-- SET @data_atual = (NOW());
SELECT 
	ped.cod_pedido AS 'Código Pedido',
	nf.nr_nota_fiscal AS 'Nº Nota', 
	revenda.nome_colaborador AS 'Nome Revenda', 
	cd_familia_comercial.desc_abrev AS 'Familia Comercial',
	nf.vl_total_nota_fiscal AS 'Total NF',
	itemNf.qtd AS 'Quantidade',
	nf.dt_emissao AS 'Data de emissão'
	
	
FROM
vd_nota_fiscal_item AS itemNf
LEFT JOIN vd_nota_fiscal AS nf
ON itemNf.cod_nota_fiscal = nf.cod_nota_fiscal
-- JOIN vd_pedido AS ped ON ped.cod_pedido = itemNf.cod_pedido
JOIN cd_produto AS prod ON prod.cod_produto = itemNf.cod_produto
JOIN cd_familia_comercial ON cd_familia_comercial.cod_familia_comercial = prod.cod_familia_comercial
JOIN sg_colaborador AS revenda ON revenda.cod_colaborador = nf.cod_revenda
-- JOIN sg_colaborador AS colab ON revenda.cod_colaborador = nf.cod_colaborador
WHERE DATE(nf.dt_emissao)
AND TIME(@data_atual)
AND nf.situacao = 80  
-- AND nf.ind_estatistica_venda = 1 
-- GROUP BY Produto
ORDER BY DATE(nf.dt_emissao) DESC 
LIMIT 5 ;
#####################################################################################################################################################

############################################################PEDIDOS POR SITUAÇÃO#####################################################################
SELECT SUM(item.preco_venda_original * item.qtd) AS Faturamento, situacao.descricao FROM vd_pedido_item AS item
LEFT JOIN vd_pedido AS pedido 
ON pedido.cod_pedido = item.cod_pedido
LEFT JOIN vd_ponto_controle AS situacao 
ON pedido.situacao = situacao.cod_controle
WHERE MONTH (pedido.dt_alteracao) = MONTH(NOW()) AND pedido.situacao IN (7,13,30,55,61)
GROUP BY pedido.situacao;


SELECT COUNT(pedido.cod_pedido) AS Faturamento, pedido.situacao, situacao.descricao FROM vd_pedido_item AS item
LEFT JOIN vd_pedido AS pedido 
ON pedido.cod_pedido = item.cod_pedido
LEFT JOIN vd_ponto_controle AS situacao 
ON pedido.situacao = situacao.cod_controle
WHERE MONTH (pedido.dt_alteracao) = MONTH(NOW()) AND pedido.situacao IN (7,13,30,55,61)
GROUP BY pedido.situacao;
#####################################################################################################################################################