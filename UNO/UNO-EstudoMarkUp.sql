/*Pedido analisado 175006

*/

-- SET @pedido = 175006;
-- SET @empresa = 1;
-- SELECT * FROM  vd_pedido_item WHERE cod_pedido = @pedido; -- .vl_custo_total
-- SELECT * FROM  vd_nota_fiscal_item WHERE cod_pedido = @pedido; -- .vl_custo_total

SET @pedido = 175006;
SET @empresa = 1;
SELECT vd_pedido_item.cod_pedido, vd_nota_fiscal_item.cod_pedido,
		 vd_pedido_item.cod_produto, vd_nota_fiscal_item.cod_produto,	  
		 vd_pedido_item.qtd, vd_nota_fiscal_item.qtd, 
		 vd_pedido_item.preco_venda, vd_nota_fiscal_item.preco_venda,
		 vd_pedido_item.preco_total, vd_nota_fiscal_item.preco_total,
		 vd_pedido_item.preco_unit_base, vd_nota_fiscal_item.preco_unit,
		 vd_pedido_item.preco_venda_original, vd_nota_fiscal_item.preco_venda_original, 
		 vd_pedido_item.vl_custo_total, vd_nota_fiscal_item.vl_custo_total,
		 vd_pedido_item.vl_custo_total / vd_pedido_item.qtd AS 'Custo unitário no vd_pedido_item'
FROM vd_pedido_item JOIN vd_nota_fiscal_item
ON vd_pedido_item.cod_empresa = vd_nota_fiscal_item.cod_empresa
	AND vd_pedido_item.cod_pedido = vd_nota_fiscal_item.cod_pedido
WHERE vd_pedido_item.cod_empresa = @empresa AND vd_pedido_item.cod_pedido IN (177250,177334,177462,177468,177491,177522,177525,177531,177534,177644,177645)




