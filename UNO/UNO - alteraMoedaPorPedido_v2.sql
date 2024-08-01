SELECT *
FROM vd_pedido
WHERE cod_pedido = 79134

UPDATE vd_pedido
SET moeda = 'R$'
WHERE cod_pedido = 79134

UPDATE vd_pedido SET moeda = '$'
WHERE cod_pedido = 77927