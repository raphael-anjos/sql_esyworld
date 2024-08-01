/*Atualiza no cadstro do item os campos
tipo de inventário, reserva lote no pedido, atualiza estoque, politica de preço
Por familia comercial no script abaixo estamos alterando para sonicWall Hardware*/
UPDATE cd_produto
SET tp_inventario = 3, ind_reserva_pedido = 1, ind_estoque = 1, ind_politica_preco = 1
WHERE cod_familia_comercial = 36

/*Simplificadao para ajustar a politica de preços no cadastro de produtos
e ajustar o código RPS
*/

START TRANSACTION;
UPDATE cd_produto
SET ind_politica_preco = 1, cod_produto_rps = '02800'
WHERE cod_produto IN ('PTLASTDSD1099-1Y','PTLASTDSD100249-1Y','PTLASTDSD250499-1Y',
'PTLASTDSD500999-1Y','PTLASTDSD10004999-1Y','PTLASTDSD5000-1Y','PTLASTDSD1099-3Y',
'PTLASTDSD100249-3Y','PTLASTDSD250499-3Y','PTLASTDSD500999-3Y','PTLASTDSD10004999-3Y',
'PTLASTDSD5000-3Y','POLASTDSD1099-1Y','POLASTDSD100249-1Y','POLASTDSD250499-1Y','
POLASTDSD500999-1Y','POLASTDSD10004999-1Y','POLASTDSD5000-1Y','POLASTDSD1099-3Y',
'POLASTDSD100249-3Y','POLASTDSD250499-3Y','POLASTDSD500999-3Y','POLASTDSD10004999-3Y',
'POLASTDSD5000-3Y');
