/*Data: 2020-02-14
Objetivo: Ajustar no Sistema quando o preço de revenda foi informado de forma incorreta, 
normalmente maior que o preço de venda sendo assim não gera comissão para a Revenda.
Este processo pode ser realizado após o pedido ter sido Faturado.
*/
START TRANSACTION;
SET @pedido = 148279;
SET @produto = 520168;
SET @precoRevenda = 2200;

UPDATE vd_pedido_item SET preco_venda_original = @precoRevenda
WHERE cod_pedido = @pedido AND cod_produto = @produto;

UPDATE vd_nota_fiscal_item SET preco_venda_original = @precoRevenda
WHERE cod_pedido = @pedido AND cod_produto = @produto;

SELECT cod_pedido, cod_produto, preco_venda_original
FROM vd_pedido_item
WHERE cod_pedido = @pedido AND cod_produto = @produto;

SELECT cod_pedido, cod_produto, preco_venda_original
FROM vd_nota_fiscal_item
WHERE cod_pedido = @pedido AND cod_produto = @produto;


ROLLBACK;
COMMIT;
