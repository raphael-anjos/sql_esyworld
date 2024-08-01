SET @ano =  YEAR(CURDATE());
SELECT 
		ped.cod_pedido AS 'Código Pedido',
		nf.dt_emissao AS 'Data Pedido',
		ped.cod_revenda AS 'Cod.Revenda',
		comissao.tp_owner 'Tipo Participante',
		comissao.perc_participacao AS '% Participação no pedido'
		
					
FROM
vd_nota_fiscal_item AS itemNf
LEFT JOIN vd_nota_fiscal AS nf
ON itemNf.cod_nota_fiscal = nf.cod_nota_fiscal
JOIN vd_pedido AS ped ON ped.cod_pedido = itemNf.cod_pedido
JOIN cd_nop ON cd_nop.nop = nf.nop
JOIN vd_pedido_comissao AS comissao ON comissao.cod_pedido = ped.cod_pedido
JOIN sg_colaborador AS cad_revenda ON cad_revenda.cod_colaborador = nf.cod_revenda
WHERE YEAR(nf.dt_emissao) >= @ano-1  AND nf.situacao <> 200 AND cd_nop.ind_estatistica_venda = 1
