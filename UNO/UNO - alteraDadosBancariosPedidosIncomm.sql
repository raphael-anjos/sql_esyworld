/*Data 27/11/2017
Alterar os dados bancarios para titulos de pedidos incomm
*/
update fn_titulo_receber
set cod_banco = 35, cod_forma_pagto = 30, perc_juros = 0
where cod_pedido in (SELECT cod_pedido
							FROM vd_pedido
							where cod_revenda = 5871);