/*Data: 22/08/2017
Altera o banco para banco 35 Incomm de todos os titulos que etão com forma de pagamneto
30 - Incomm Card no contas a Receber pois estes são pedidos vindo da loja Virtual
*/
start transaction;
select cod_forma_pagto, cod_banco
from fn_titulo_receber
where cod_forma_pagto = 30;

update fn_titulo_receber
set cod_banco = 35
where cod_forma_pagto = 30;

select cod_forma_pagto, cod_banco
from fn_titulo_receber
where cod_forma_pagto = 30;

rollback;

commit;