/*Data: 13/12/2017
Altera a forma de pagamento de 8-Cartão de Crédito para 9-Transferência entre Contas
para os titulos gerado em nosso contas a receber de pedidos originados da Loja Virtual.
*/

start transaction;
update fn_titulo_receber as fn join vd_pedido as ped
on fn.cod_pedido = ped.cod_pedido
set fn.cod_forma_pagto = 9
where fn.cod_forma_pagto = 8 and ped.cod_colaborador = 5794;
rollback;
commit;




