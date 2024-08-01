/*Data: 2023-12-14
Objetivo: Retornar o faturamento por revenda de forma analitica retornando valores de revenda e valor de faturamento,
utilizando os códigos das revendas e data de emissão da nota fiscal*/

SELECT cd_cliente.cod_revenda_gerado AS 'código revenda', cd_cliente.razao_social AS 'Nome Revenda',
vd_nota_fiscal_item.cod_pedido AS 'pedido', vd_nota_fiscal_item.cod_produto AS 'SKU', vd_nota_fiscal_item.desc_nota_fiscal AS 'Descrição', 
vd_nota_fiscal_item.qtd AS 'quantidade', vd_nota_fiscal_item.preco_venda_original AS 'preco revenda', vd_nota_fiscal_item.preco_venda AS 'preço venda', 
(vd_nota_fiscal_item.qtd * vd_nota_fiscal_item.preco_venda_original) AS 'Total Revenda', 
(vd_nota_fiscal_item.qtd * vd_nota_fiscal_item.preco_venda) AS 'Total Venda', 
CASE
WHEN RIGHT(vd_nota_fiscal_item.cod_produto,1) IN ('S','8') AND LEFT(vd_nota_fiscal_item.cod_produto,1) = 'K' THEN 'Base'
WHEN RIGHT(vd_nota_fiscal_item.cod_produto,1) IN ('R','9') AND LEFT(vd_nota_fiscal_item.cod_produto,1) = 'K' THEN 'Renew'
WHEN RIGHT(vd_nota_fiscal_item.cod_produto,1) IN ('E','Q') AND LEFT(vd_nota_fiscal_item.cod_produto,1) = 'K' THEN 'Renewal Educational'
WHEN RIGHT(vd_nota_fiscal_item.cod_produto,1) IN ('C','J') AND LEFT(vd_nota_fiscal_item.cod_produto,1) = 'K' THEN 'Renewal Governmental'
WHEN RIGHT(vd_nota_fiscal_item.cod_produto,1) IN ('P','D') AND LEFT(vd_nota_fiscal_item.cod_produto,1) = 'K' THEN 'Renewal Public Sector'
WHEN RIGHT(vd_nota_fiscal_item.cod_produto,1) IN ('G','4') AND LEFT(vd_nota_fiscal_item.cod_produto,1) = 'K' THEN 'Successive'
WHEN RIGHT(vd_nota_fiscal_item.cod_produto,1) = 'W' AND LEFT(vd_nota_fiscal_item.cod_produto,1) = 'K' THEN 'Cross Grade'
WHEN RIGHT(vd_nota_fiscal_item.cod_produto,1) = 'I' AND LEFT(vd_nota_fiscal_item.cod_produto,1) = 'K' THEN 'Subscription'
WHEN RIGHT(vd_nota_fiscal_item.cod_produto,1) = 'H' AND LEFT(vd_nota_fiscal_item.cod_produto,1) = 'K' THEN 'AddOn'
WHEN RIGHT(vd_nota_fiscal_item.cod_produto,1) = 'U' AND LEFT(vd_nota_fiscal_item.cod_produto,1) = 'K' THEN 'Upgrade'
WHEN RIGHT(vd_nota_fiscal_item.cod_produto,1) = 'Z' AND LEFT(vd_nota_fiscal_item.cod_produto,1) = 'K' THEN 'Certificate'
ELSE 'Indefinido'
END AS 'tipo'
FROM cd_cliente LEFT JOIN vd_pedido
ON cd_cliente.cod_revenda_gerado = vd_pedido.cod_revenda
LEFT JOIN vd_nota_fiscal
ON vd_pedido.cod_pedido = vd_nota_fiscal.cod_pedido
LEFT JOIN vd_nota_fiscal_item
ON vd_nota_fiscal.cod_pedido = vd_nota_fiscal_item.cod_pedido
WHERE cd_cliente.cod_revenda_gerado IN (206,6072) AND vd_nota_fiscal.dt_emissao BETWEEN '2022-01-01' AND NOW()













