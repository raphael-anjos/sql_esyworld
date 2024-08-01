/*Data 2020-04-10
Objetivo: Realizar o ajuste da lista de preço em um pedido gerado
através da devolução de um pedido.
As váriaveis 
SET @pedidoOrigem = 159108; refere-se ao pedido que foi devolvido
SET @pedidoEntrada = 159541; refere-se ao pedido gerado com a devolução
*/

-- Ajusta a tabela de preço na capa do pedido
START TRANSACTION;
SET @pedidoOrigem = 159108 ;
SET @pedidoEntrada = 159541;
UPDATE vd_pedido SET tb_preco = (SELECT tb_preco FROM vd_pedido WHERE cod_pedido = @pedidoOrigem)
WHERE cod_pedido = @pedidoEntrada; 
ROLLBACK;
COMMIT;

-- Ajusta a tabela de preço no item do pedido.
START TRANSACTION;
SET @pedidoOrigem = 159108 ;
SET @pedidoEntrada = 159541;
UPDATE vd_pedido_item SET tb_preco = (SELECT tb_preco FROM vd_pedido_item WHERE cod_pedido = @pedidoOrigem)
WHERE cod_pedido = @pedidoEntrada; 
ROLLBACK;
COMMIT;