##Retorna todos os pedidos faturado em determinado periodo, por valor e condição de pagamento.
set @dataInicial= '2016-01-01';
set @dataFinal= '2016-03-31';
set @valor = 300;

select cod_pedido , vl_total_produtos, vl_total_pedido, 
(vl_total_pedido - vl_total_produtos) as 'Dif. Prod/Ped',dt_aprovacao, cod_cond_pagto, situacao
from vd_pedido
where dt_aprovacao between @dataInicial and @dataFinal and situacao = 80
		and vl_total_pedido between 1 and 300 and cod_cond_pagto not in ('1','av');

##Quantidade de Pedidos por Mes Ano
set @dataInicial= '2016-01-01';
set @dataFinal= '2016-03-31';
set @valor = 300;

select count(cod_pedido) as 'Qtd Pedido' , month(dt_aprovacao) as 'Mes', year(dt_aprovacao) as 'Ano'
from vd_pedido
where dt_aprovacao between @dataInicial and @dataFinal and situacao = 80
		and vl_total_pedido between 1 and 300 and cod_cond_pagto not in ('1','av')
		group by Mes , Ano;
		
		
##Retorna todos os pedidos faturado em determinado periodo, por valor e condição de pagamento.
set @dataInicial= '2016-01-01';
set @dataFinal= '2016-03-31';
set @valor = 300;

select cod_pedido , vl_total_produtos, vl_total_pedido, 
(vl_total_pedido - vl_total_produtos) as 'Dif. Prod/Ped',dt_aprovacao, cod_cond_pagto, situacao
from vd_pedido
where dt_aprovacao between @dataInicial and @dataFinal and situacao = 80
		and vl_total_pedido between 1 and 300 and cod_cond_pagto not in ('1','av');

