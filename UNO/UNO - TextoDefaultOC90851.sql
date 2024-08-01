UPDATE `db_uc_esyworld`.`cd_texto` 
SET `def_texto`='Caro(a)  <NOME_COLABORADOR>,\r\n\r\n<br/>
Informamos que na data de hoje, realizamos a programação de  
pagamento de comissionamento para a data <DT_VENCIMENTO>. 
Referente  aos pedidos <COD_PEDIDO>  no valor total de R$ <VALOR_TOTAL_COMISSAO>.\r\n\r\n\r\n
<TABELA_COMISSOES_OK>\r\n\r\n\r\nSolicitamos que providencie a geração de nota fiscal e 
encaminhe para o financeiro da Esyworld informando o seguinte Número : <COD_TITULO>\r\n\r\n<br/><br/>
\r\nAtensiosamente,\r\n\r\n<br/><br/>\r\nEsyworld' WHERE `cod_texto`=65;

UPDATE `db_uc_esyworld`.`cd_texto` 
SET `tags_permitidas`='<DONO_COMISSAO>, <PERIODO_INICIAL>, <PERIODO_FINAL>, 
						<NOME_COLABORADOR>, <COD_TITULO>, <COD_PARCELA>, 
						<TABELA_COMISSOES_OK> ,<DT_VENCIMENTO>,<DATA_HOJE>,
						<COD_PEDIDO> e <VALOR_TOTAL_COMISSAO>' 
WHERE `cod_texto`=65;