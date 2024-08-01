#Altera no cadastro de cliente a forma de pagamento padrão de 1-Boleto para 2-Boleto Eletrônico
update cd_cliente
set cod_forma_pagto = 2
where cod_forma_pagto = 1