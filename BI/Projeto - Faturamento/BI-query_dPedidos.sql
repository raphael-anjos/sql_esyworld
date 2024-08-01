SET @ano =  YEAR(CURDATE());
SELECT 
		DISTINCT  (ped.cod_pedido) AS 'Codigo Pedido',
		nf.dt_emissao AS 'Data Pedido'
		
					
FROM
vd_nota_fiscal_item AS itemNf
LEFT JOIN vd_nota_fiscal AS nf
ON itemNf.cod_nota_fiscal = nf.cod_nota_fiscal
JOIN vd_pedido AS ped ON ped.cod_pedido = itemNf.cod_pedido
JOIN cd_nop ON cd_nop.nop = nf.nop
WHERE YEAR(nf.dt_emissao) >= @ano-1  AND nf.situacao <> 200 AND cd_nop.ind_estatistica_venda = 1
