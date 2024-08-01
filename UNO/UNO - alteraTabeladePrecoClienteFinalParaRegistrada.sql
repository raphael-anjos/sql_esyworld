/*Retorna todos os clientes com situação diferente de inativo
com tabela de preco CLIENTEFINAL*/
SELECT *
FROM cd_cliente
WHERE tb_preco = 'CLIENTEFINAL' 
		AND cod_revenda_gerado IS NOT NULL;	
		

/*Altera a tabela de preço padrão de CLIENTEFINAL para REGISTRADA*/
UPDATE cd_cliente 
SET tb_preco = 'REGISTRADA'
WHERE tb_preco = 'CLIENTEFINAL' 
	AND cod_revenda_gerado IS NOT NULL;

