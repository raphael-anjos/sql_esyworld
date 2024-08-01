/*Data: 2020-05-15
Objetivo: Ajustar o Código RPS de Serviços para nã ter probelmas no momento do Faturamento.
*/

#Retorna Serviços cadastrados com código RPS igual a 2800 ou NULO da tabela cd_produto
SELECT cod_produto, cod_produto_rps
FROM cd_produto
WHERE ind_servico = 1 AND (cod_produto_rps = '2800' OR cod_produto_rps IS NULL);

/*Retorna da tabela cd_produto_empresa registros que estão como serviços em cd_produto,
porém estão com atributo cod_produto_rps nulo ou como 2800 na tabela cd_produto_empresa.*/
SELECT  cod_produto, cod_produto_rps 
FROM cd_produto_empresa
WHERE (cod_produto_rps = '2800' OR cod_produto_rps IS NULL) AND  
cod_produto IN (SELECT cod_produto FROM cd_produto WHERE ind_servico = 1);

/*Atualiza o atributo cod_produto_rps na tabela cd_produto para os registros marcado como
Serviço onde o atributo cod_produto_rps esta como NULO ou 2800 */
START TRANSACTION;
UPDATE cd_produto 
SET cod_produto_rps = '02800'
WHERE ind_servico = 1 AND (cod_produto_rps = '2800' OR cod_produto_rps IS NULL);
COMMIT; 

/*Atualiza o atributo cod_produto_rps para 02800 na tabela cd_prduto_empresa para os itens
cadastrados como serviço em cd_produto e que na tabela cd_produto_empresa estejam com 
cod_produto_rps nulo ou como 2800*/
START TRANSACTION;
UPDATE cd_produto_empresa
SET cod_produto_rps = '02800'
WHERE (cod_produto_rps = '2800' OR cod_produto_rps IS NULL) AND  
cod_produto IN (SELECT cod_produto FROM cd_produto WHERE ind_servico = 1);
COMMIT;

