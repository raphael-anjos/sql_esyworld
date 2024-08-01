/*Data 2020-04-03
Objetivo: Realizar o cancelamento do pedido no ERP, em situções
onde o prazo para cancelamento da nota tenha sido ultrapassado.
Para que o pedido não seja apresentado nos resultados de 
faturamento no ERP.
*/

START TRANSACTION;
SET @pedido = 161831;
UPDATE vd_pedido_item SET situacao = 200 WHERE cod_pedido = @pedido;
UPDATE vd_pedido SET situacao = 200 WHERE cod_pedido = @pedido;
UPDATE vd_nota_fiscal SET situacao = 200 WHERE cod_pedido = @pedido;
ROLLBACK;
COMMIT;


SET @pedido = 161831;
SELECT cod_pedido, situacao FROM vd_pedido_item WHERE cod_pedido = @pedido;
SELECT cod_pedido, situacao FROM vd_pedido WHERE cod_pedido = @pedido;
SELECT cod_pedido, situacao FROM vd_nota_fiscal WHERE cod_pedido = @pedido;



''