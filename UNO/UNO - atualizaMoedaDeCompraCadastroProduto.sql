/*
Data: 2017-04-06
Objetivo: Atualizar a Moeda de Compra no Cadastro do Produto 
por Grupo de Produto.
Projeto: Importação Produtos IpSwitch
*/

START TRANSACTION;
UPDATE cd_produto_empresa
SET moeda_compra = 'US$'
WHERE cd_produto_empresa.cod_produto IN (
SELECT cod_produto
FROM cd_grupo_item
WHERE cod_grupo_produto = 5391);

UPDATE cd_produto_empresa
SET moeda_compra = 'US$'
WHERE cd_produto_empresa.cod_produto IN (
SELECT cod_produto
FROM cd_grupo_item
WHERE cod_grupo_produto = 5390);

COMMIT;
ROLLBACK;