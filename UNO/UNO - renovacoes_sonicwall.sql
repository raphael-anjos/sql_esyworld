/*Data: 2024-02-27
Objetivo: Obter realação de Renovações de Licenças SonicWall
Método: Vamos realizar a previsão das renovações, utilizando como parametro a data da venda da licença, 
para chegarmos da data de expiração.
Utilizamos o atributo dias de validade, informado no cadastro da licença, este atributi deve ser informado
em caso de novos cadastros. 
*/

SELECT at_oportunidade.cod_oportunidade AS 'Oportunidade',
vd_pedido_item.cod_pedido AS 'Pedido',
cd_cliente.cod_cliente AS 'Cód Cliente',
cd_cliente.razao_social AS 'Razão Social',
vd_pedido.cod_revenda AS 'Cód Revenda', 
sg_colaborador.nome_colaborador AS 'Revenda',
vd_pedido_item.cod_produto AS 'Cód Produto', 
vd_pedido_item.desc_comercial AS 'Desc Produto',
FORMAT(vd_pedido_item.qtd,0) AS 'Quant',
vd_pedido_item.tb_preco AS 'Lista Praticada Venda', 
FORMAT(vd_pedido_item.preco_venda_original,2) AS 'Unit Revenda', 
FORMAT(vd_pedido_item.preco_venda,2) AS 'Unit Venda', 
FORMAT((vd_pedido_item.qtd * vd_pedido_item.preco_venda_original),2) AS 'Total Revenda',
FORMAT((vd_pedido_item.qtd * vd_pedido_item.preco_venda),2) AS 'Total Venda',
vd_nota_fiscal.dt_emissao AS 'Data Faturamento',
-- SUBSTRING(vd_pedido_item.desc_comercial,-3,1) 'Período Anos',
DATE_ADD(vd_nota_fiscal.dt_emissao, INTERVAL SUBSTRING(vd_pedido_item.desc_comercial,-3,1) YEAR) AS 'Data Expiração',
CONCAT('Q',QUARTER(DATE_ADD(vd_nota_fiscal.dt_emissao, INTERVAL SUBSTRING(vd_pedido_item.desc_comercial,-3,1) YEAR))) AS 'Quarter'

FROM vd_pedido_item LEFT JOIN vd_pedido
ON vd_pedido_item.cod_pedido = vd_pedido.cod_pedido
LEFT JOIN vd_nota_fiscal
ON vd_pedido.cod_pedido = vd_nota_fiscal.cod_pedido
LEFT JOIN sg_colaborador
ON vd_pedido.cod_revenda = sg_colaborador.cod_colaborador 
LEFT JOIN cd_produto
ON vd_pedido_item.cod_produto = cd_produto.cod_produto
LEFT JOIN cd_cliente 
ON vd_pedido.cod_cliente = cd_cliente.cod_cliente
LEFT JOIN at_oportunidade
ON vd_pedido.cod_oportunidade = at_oportunidade.cod_oportunidade
WHERE cd_produto.cod_fornecedor = 11945
-- cd_produto.cod_familia_comercial = 37
AND vd_nota_fiscal.situacao = 80
AND cd_produto.dias_validade > 0
AND vd_nota_fiscal.dt_emissao >= '2019-01-01'
AND YEAR(DATE_ADD(vd_nota_fiscal.dt_emissao, INTERVAL SUBSTRING(vd_pedido_item.desc_comercial,-3,1) YEAR)) = YEAR(NOW())







