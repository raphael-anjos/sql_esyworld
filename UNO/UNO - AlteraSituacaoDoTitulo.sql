/*Data: 2019-03-22
Objetivo: Voltar titulo em contas a receber para situação de ativo
*/
START TRANSACTION;

SET @pedido = 123980;
SET @titulo = 98997;
SET @parcela = 1;

UPDATE fn_titulo_receber
SET situacao = 10
WHERE cod_empresa = 1 AND  cod_pedido = @pedido
AND cod_titulo = @titulo AND cod_parcela = @parcela;

ROLLBACK;
COMMIT;