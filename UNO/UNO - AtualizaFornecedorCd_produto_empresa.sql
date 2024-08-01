/*Data: 2018-04-17
Objetivo: Ajustar moeda e fornecedor com base no cadastro de produto com a tabela cd_produto_empresa.
*/
start transaction;
update cd_produto join cd_produto_empresa
on cd_produto.cod_produto = cd_produto_empresa.cod_produto
SET cd_produto_empresa.cod_fornecedor = cd_produto.cod_fornecedor,
	 cd_produto_empresa.moeda_compra = cd_produto.moeda
WHERE cd_produto.cod_familia_comercial IN (15,16) and 
		cd_produto_empresa.cod_empresa = 1;
		
		
select cd_produto_empresa.cod_produto, cd_produto.cod_produto,
		 cd_produto_empresa.cod_fornecedor,cd_produto.cod_fornecedor,
	    cd_produto_empresa.moeda_compra,cd_produto.moeda
from 	cd_produto join cd_produto_empresa
on cd_produto.cod_produto = cd_produto_empresa.cod_produto
WHERE cd_produto.cod_familia_comercial IN (15,16) and 
		cd_produto_empresa.cod_empresa = 1;		
		
commit;