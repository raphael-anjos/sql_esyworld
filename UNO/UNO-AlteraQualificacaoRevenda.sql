/*Data: 2022-06-01
Objetivo: Reorganizar a qualificação das revendas em relação da Cylance onde vamos 
deixar uma unica qualificação vinculada a todas as revendas.
*/
/*Remove as qualificações [157 - CYLANCE_ESME | 159 - CYLANCE_GOLD | 158 - CYLANCE_PLAT]
de todos os clientes*/
START TRANSACTION;
DELETE FROM cd_cliente_atividade
WHERE cod_ramo_atividade IN (157,158,159);
COMMIT;

/*Este retorno deve ser ZERO*/
SELECT cod_ramo_atividade, COUNT(cod_cliente)
FROM cd_cliente_atividade 
WHERE cod_ramo_atividade IN (157,158,159)
GROUP BY 1;

/*Insere a qualificação [157 - CYLANCE_ESME] para todas as Revendas que estejam com as 
seguintes situação no cadastro de cliente [1-"ATIVO" | 2-"SUSPECT" | 3-"PROSPECT"]*/

START TRANSACTION;
SET @cod_qualificacao = 157;

INSERT INTO cd_cliente_atividade (cod_cliente, cod_ramo_atividade)
SELECT DISTINCT(cod_cliente), @cod_qualificacao
FROM cd_cliente
WHERE cod_revenda_gerado > 0;
ROLLBACK;
COMMIT;

/*Retorna dados de revenda do cadasrtro de clientes*/

SELECT cod_cliente, cod_revenda_gerado, nome_cliente, razao_social, 
 CASE
    WHEN situacao = 0 THEN "INATIVO"
    WHEN situacao = 1 THEN "ATIVO"
    WHEN situacao = 2 THEN "SUSPECT"
    WHEN situacao = 3 THEN "PROSPECT"
    WHEN situacao = 9 THEN "BLOQUEADO"
    WHEN situacao = 10 THEN "CANCELADO"
    ELSE "DESCONHECIDO"
  END AS 'Situação',
	cod_colaborador
FROM cd_cliente
WHERE cod_revenda_gerado > 0 AND situacao IN (1,2,3)


