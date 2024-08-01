/*Data 28/11/2017
Objetivo ajustar o Percentual de comissão das revendas no pedidos cadastrados 
apartir de 10/08/2017 pois até 22/11/2017 o sistema estava aplicando o percentual
87,75% este percentual estava chumbado no código */

select com.*
from vd_pedido as ped join vd_pedido_comissao as com
on ped.cod_pedido = com.cod_pedido
where ped.dt_implant >= '2017-08-10' and com.tp_owner = 2 and perc_comissao <> 0.8875;


start transaction;

update vd_pedido_comissao as com
join vd_pedido as ped
on ped.cod_pedido = com.cod_pedido
set com.perc_comissao = 0.8875, tp_comissao = 3
where ped.dt_implant >= '2017-08-10' and com.tp_owner = 2 
 	and perc_comissao <> 0.8875;
	
rollback;
commit;	