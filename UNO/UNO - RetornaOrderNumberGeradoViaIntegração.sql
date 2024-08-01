/*Data: 2020-08-07
Objetivo obter o orderNumber gerado via integração KORM para atualizar o orderNumber 
gravado no vd_pedido item.
*/
SELECT cod_pedido, dt_referencia, descricao, SUBSTRING(descricao, 30,11) AS cod_produto,
SUBSTRING(descricao, 68)
FROM vd_pedido_hist
WHERE tp_historico = 140 AND dt_referencia BETWEEN '2015-01-01' AND '2020-08-07' AND cod_pedido = 76311;
76
SELECT * FROM vd_pedido_item WHERE cod_pedido = 76311; 