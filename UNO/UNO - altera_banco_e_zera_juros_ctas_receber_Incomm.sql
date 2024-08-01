/*Data: 22/08/2017
Altera o banco para 35 Incomm de todos os titulos que estão com forma de pagamneto
30 - Incomm Card no contas a Receber, e zera o juros no titulo pois estes são 
pedidos vindo da loja Virtual, e os mesmos já foram pagos.
*/
start transaction;
select cod_titulo,cod_forma_pagto, cod_banco, perc_juros
from fn_titulo_receber
where cod_forma_pagto = 30;

update fn_titulo_receber
set cod_banco = 35, perc_juros = 0
where cod_forma_pagto = 30;

select cod_titulo,cod_forma_pagto, cod_banco, perc_juros
from fn_titulo_receber
where cod_forma_pagto = 30 and cod_banco <> 35;

rollback;

commit;