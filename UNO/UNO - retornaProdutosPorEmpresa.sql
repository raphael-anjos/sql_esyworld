#Data: 2016-04-11
#Etapa 01 para atualização de Cadastro de Produtos.
#Retorna o codigo do produto, codigo do Fornecedor e Descrição do Produto
#por EMPRESA especifica.
SELECT prd.cod_produto, prd.cod_fornecedor, prd.desc_comercial
FROM cd_produto as prd join cd_produto_empresa as prde
ON prd.cod_produto = prde.cod_produto
where prde.cod_empresa = 1 and prd.cod_produto like 'KL%';

