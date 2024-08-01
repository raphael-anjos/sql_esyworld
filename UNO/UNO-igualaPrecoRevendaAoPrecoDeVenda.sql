/*Data: 2022-07-19
Objetivo: Igualar preço de revenda oa preço de venda para que não seja gerada comissão
para a revenda, este processo é utilizado quando o vendedor coloca o pedido de forma incorreta
sendo o faturamento contra a Revenda, e neste caso a mesma não deve receber comissão.
*/
START TRANSACTION;
SET @pedido = 158185;
UPDATE vd_nota_fiscal_item SET preco_venda_original = preco_venda WHERE cod_pedido = @pedido;
UPDATE vd_pedido_item SET preco_venda_original = preco_venda WHERE cod_pedido = @pedido;
COMMIT;



