/*Data: 22/03/2017
Atualiza preço de item especifico em todas as listas
*/
set @preco = 25.31;
set @cdProduto = 'BEOESI100a-c12'; 
update cd_preco_item
set preco_unit = @preco , ind_ajuste_preco = 1
where cod_produto = @cdProduto;
