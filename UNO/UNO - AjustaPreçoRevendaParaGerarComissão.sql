/*Data: 2021-05-20
Objetivo: Ajustar no Sistema quando o preço de revenda foi informado de forma incorreta, 
normalmente maior que o preço de venda sendo assim não gera comissão para a Revenda.
Este processo pode ser realizado após o pedido ter sido Faturado.
*


#01 - Primeiro devemos realizar o ajuste dos valores no vd_pedido_item onde devemos ajustar os valores de [preco_venda e preco_venda_original]
# No script - 01 devemos informar o numero do pedido o código do produto e o preco de revenda.
# A atualização será realizada na tabela vd_pedido_item e vd_nota_fiscal_item

##### SCRIPT - 01 #####
START TRANSACTION;
SET @pedido = 148279;
SET @produto = 520168;
SET @precoRevenda = 2200;

UPDATE vd_pedido_item SET preco_venda_original = @precoRevenda
WHERE cod_pedido = @pedido AND cod_produto = @produto;

UPDATE vd_nota_fiscal_item SET preco_venda_original = @precoRevenda
WHERE cod_pedido = @pedido AND cod_produto = @produto;

ROLLBACK;
COMMIT;


/*Aqui realizamos a atualização no vd_nota_fiscal_item o preco de venda original com o mesmo valor que está na vd_item_pedido*/
/*START TRANSACTION;
UPDATE vd_nota_fiscal_item AS nf JOIN vd_pedido_item AS item
ON nf.cod_pedido = item.cod_pedido AND nf.cod_produto = item.cod_produto
SET nf.preco_venda_original = item.preco_venda_original
WHERE item.cod_pedido IN (150578,151693,151561,151587,151685,151027,151027,151088,151594);
COMMIT;
*/

/*
SELECT nf.cod_pedido, nf.cod_produto, nf.preco_venda_original, nf.preco_venda,
item.cod_pedido, item.cod_produto, item.preco_venda_original, item.preco_venda
FROM vd_nota_fiscal_item AS nf JOIN vd_pedido_item as item
ON nf.cod_pedido = item.cod_pedido AND nf.cod_produto = item.cod_produto
WHERE item.cod_pedido IN (150578,151693,151561,151587,151685,151027,151027,151088,151594);
*/


/*ANOTAÇÕES ADICIONAIS:
Em vd_pedido_item
preco_venda 	     = preço de venda no pedido
preco_venda_original = preço de revenda 

vd_nota_fiscal.cod_nota_fiscal = fn_titulo_receber.cod_nota_fiscal

oque o sistema valida:
se no fn_titulo_receber tem linha com a baixa na situação 30 e com valor de baixa
se na vd_pedido esta marcado ind_estatistica_venda como 1
se na fn_titulo_receber esta o mesmo cod nota fiscal que consta na vd_nota_fiscal
e se tem na vd_pedido_comissão
*/
