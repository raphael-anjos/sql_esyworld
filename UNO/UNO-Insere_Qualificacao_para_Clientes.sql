/*Insere uma qualificacao para todos os clientes que possuem ao menos uma qualificacao*/

START TRANSACTION;
SET @cod_qualificacao = 171;

INSERT INTO
cd_cliente_atividade (cod_cliente, cod_ramo_atividade)
SELECT DISTINCT(cod_cliente), @cod_qualificacao
FROM cd_cliente_atividade;

SELECT COUNT(DISTINCT(cod_cliente))
FROM cd_cliente_atividade
WHERE cod_ramo_atividade = @cod_qualificacao;

ROLLBACK;
COMMIT;


/*remove de todos ao clientes as qualificacoes listadas em cod_ramo_atividade*/
START TRANSACTION;
DELETE FROM cd_cliente_atividade
WHERE cod_ramo_atividade IN (13,137,138,139,140);
COMMIT;

