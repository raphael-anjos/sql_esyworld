/*atualiza o preço de revenda no pedido*/
update vd_pedido_item as item join cd_preco_item as pre
on item.cod_produto = pre.cod_produto and item.tb_preco = pre.tb_preco
SET item.preco_venda_original = pre.preco_unit
WHERE item.cod_pedido IN (select ped.cod_pedido 
								  from vd_pedido_item as item join vd_pedido as ped
								  on item.cod_pedido = ped.cod_pedido
								  where ped.cod_colaborador = 5794  and item.preco_venda_original = 0);
								  
/*atualiza o preço de revenda no pedido*/
UPDATE vd_pedido_item, vd_pedido, cd_preco_item 
SET vd_pedido_item.preco_venda_original = cd_preco_item.preco_unit 
WHERE vd_pedido.cod_colaborador = 5794 AND 
	   vd_pedido_item.cod_pedido = vd_pedido.cod_pedido AND 
		vd_pedido_item.cod_empresa = vd_pedido.cod_empresa AND 
		vd_pedido_item.preco_venda_original = 0 AND 
		cd_preco_item.cod_produto = vd_pedido_item.cod_produto AND 
		cd_preco_item.tb_preco = vd_pedido_item.tb_preco

/*Atualiza a comissão por titulo pago*/		
UPDATE vd_pedido_item, vd_nota_fiscal_item
SET vd_nota_fiscal_item.preco_venda_original = vd_pedido_item.preco_venda_original
WHERE vd_nota_fiscal_item.cod_pedido = vd_pedido_item.cod_pedido AND 
vd_nota_fiscal_item.cod_empresa = vd_pedido_item.cod_empresa AND 
vd_nota_fiscal_item.nr_sequencia = vd_pedido_item.nr_sequencia AND 
vd_nota_fiscal_item.preco_venda_original = 0