/*Data: 2017-06-30
Objetivo: Deletar cadastrado de Produtos e Correlação nas Listas de Preços
dos Produtos AlienVault pertencentes a Familia Comercial: 28 - AlienVault
Para que seja realizada uma nova Importação de Cadastro de Produtos
*/

##RETORNA CODIGO DE PRODUTO, NOME PRODUTO COM BASE NAS LISTAS DE PREÇOS
##DE ACORDO COM A FAMILIA COMERCIAL DO PRODUTO DEFINIDA NO CADASTRO DO PRODUTO
SELECT prod.cod_produto, prod.desc_comercial
FROM cd_produto as prod join cd_preco_item as prodItem
ON prod.cod_produto = prodItem.cod_produto
WHERE prod.cod_familia_comercial = 28;

##DELETA OS ITENS DAS LISTAS DE PREÇOS POR FAMILIA COMERCIAL
START TRANSACTION;
DELETE cd_preco_item
FROM cd_produto JOIN cd_preco_item
ON cd_produto.cod_produto = cd_preco_item.cod_produto
WHERE cd_produto.cod_familia_comercial = 28;
COMMIT;
ROLLBACK:

##RETORNA TODOS OS PRODUTOS POR FAMILIA COMERCIAL
SELECT *
FROM cd_produto
WHERE cod_familia_comercial = 28;

##RETORNA COD_PRODUTO DAS TABELAS CD_PRODUTO E CD_PRODUTO_EMPRESA, POR FAMILIA COMERCIAL.
SELECT cd_produto_empresa.cod_produto AS EMPRESA, cd_produto.cod_produto AS PRODUTO
FROM cd_produto JOIN cd_produto_empresa
ON cd_produto.cod_produto = cd_produto_empresa.cod_produto
WHERE cd_produto.cod_familia_comercial = 28;

##DELETA CADASTRO DE PRODUTO POR FAMILIA COMERCIAL
START TRANSACTION;
DELETE cd_produto_empresa, cd_produto
FROM cd_produto JOIN cd_produto_empresa
ON cd_produto.cod_produto = cd_produto_empresa.cod_produto
WHERE cd_produto.cod_familia_comercial = 28;
COMMIT;
ROLLBACK: