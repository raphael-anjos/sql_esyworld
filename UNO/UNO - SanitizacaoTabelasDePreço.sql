#Script Executado em 05/07/2016
#Objetivo Organização de Tabelas de Preços existentes no Sistema.

/*Altera para Registrada a tabela de preço para REGISTRADA quando esta for
'CLIENTEFINAL'ou 'REVENDA'*/
UPDATE cd_cliente 
SET tb_preco = 'REGISTRADA'
WHERE tb_preco IN ('CLIENTEFINAL','REVENDA')

/*Remove a associação de items as tabelas de preços qua não estão listadas
na calusula IN*/
DELETE
FROM cd_preco_item
WHERE tb_preco NOT IN ('AIM7','BARRACUDA','GOLD','NS','PLATINUM','REGISTRADA',
								'SILVER','SOLO')

/*Atualiza no pedido a tabela de preço para REGISTRADA quando o 
pedido ainda não tiver sido faturado, e a tabela informada for 
alguma das listadas na clausula IN*/
UPDATE vd_pedido SET tb_preco = 'REGISTRADA'
WHERE situacao <= 70 AND tb_preco IN ('CLFINAL12','REVENDA','CLIENTEFINAL','REVENDA12');

/*Atualiza no item pedido a tabela de preço para REGISTRADA quando o 
pedido ainda não tiver sido faturado, e a tabela informada for 
alguma das listadas na clausula IN*/
UPDATE vd_pedido JOIN vd_pedido_item 
ON vd_pedido.cod_pedido = vd_pedido_item.cod_pedido 
SET vd_pedido_item.tb_preco = 'REGISTRADA'
WHERE vd_pedido_item.tb_preco IN ('CLFINAL12','REVENDA','CLIENTEFINAL','REVENDA12') AND vd_pedido.situacao <= 70 AND vd_pedido_item.cod_empresa = 1;

/*Atualiza no cadastro da revenda tabela de preço para REGISTRADA quando  
a tabela informada for alguma das listadas na clausula IN*/
UPDATE sg_colaborador SET tb_preco = 'REGISTRADA'
WHERE tb_preco IN ('CLFINAL12','REVENDA','REVENDA12','TabPadrao')




