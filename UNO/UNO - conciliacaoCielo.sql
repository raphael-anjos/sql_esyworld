select *
from vd_pedido
where cod_pedido = 106446;

select *
from vd_pedido_pagto
where cod_pedido = 106446;

select ped.cod_pedido, ped.cod_pedido_ecommerce,ped.cod_cond_pagto,
pag.cod_parcela,pag.dt_vencimento, pag.vl_total_parcela, 
pag.descricao
from vd_pedido as ped join vd_pedido_pagto as pag
on ped.cod_pedido = pag.cod_pedido
where ped.cod_cond_pagto in ('CCAV','CC2X','CC3X','CC4X','CC5X','CC6X',
'CC7X','CC8X','CC9X','CC10X','CC11X','CC12X') 
order by ped.cod_pedido, pag.cod_parcela;




