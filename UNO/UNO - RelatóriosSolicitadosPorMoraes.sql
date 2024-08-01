/*select * from at_oportunidade
order by cod_oportunidade desc

desc at_oportunidade;
alter table at_oportunidade modify dt_deadline datetime;
*/
##Retorna todos os cliente que possuem código de Revenda por vendedor
select cli.cod_cliente as 'Código Cliente UNO' ,
cli.cod_revenda_gerado as 'Código de Revenda',
cli.nome_cliente as 'Nome',
cli.situacao as 'Situação',
cli.cod_colaborador as 'Matricula',
colab.nome_colaborador as 'Colaborador'
from cd_cliente as cli inner join sg_colaborador as colab
on cli.cod_colaborador = colab.cod_colaborador
where cli.cod_colaborador = 29 and cli.cod_revenda_gerado is not null and cli.cod_revenda_gerado > 0;



select cod_pedido, cod_revenda, cod_cliente, nome_cliente, sum(vl_total_produtos) as 'Total' 
from vd_pedido
where cod_revenda in (3862,206,2142,214,4096,2514,2086,762,810,1114,1157,1174,1213,2923,1397,3592,2185,
1569,1594,2164,2388,1759,2133,2176,2305,2486,2719,2848,2873,3012,3091,3575,3621,4359,5214) or cod_cliente in (2567,5242,5290,5476,5489,12759,14532,26320,29004,38095,39132,39492,40430,42873,
42961,43174,43594,44494,44723,45494,46519,46861,93991,94407,95694,96947,98664,99388,100059,100812,101103,
110214,111296,118819,121866) and cod_colaborador = 29 and situacao = 80 and dt_implant between '2015-01-01' and '2015-01-31'
GROUP BY cod_cliente


##Retorna todos os pedidos de todos os vendedores dentro de um determinado periodo para vendedores ativos.
select vdp.cod_revenda as 'CodRev', cli.nome_cliente as 'Revenda', cli.situacao as 'Situação', colab.cod_colaborador as 'Código',
colab.nome_colaborador as 'Colaborador',vdp.cod_cliente as 'CodCli', vdp.nome_cliente as 'Nome Cliente',vdi.cod_pedido as 'Pedido',
(vdi.qtd*vdi.preco_venda_original) as 'Preço Revenda',(vdi.qtd*vdi.preco_venda) as 'Preço De Venda',date_format(vdp.dt_implant,'%m/%Y') as 'Data'

from vd_pedido as vdp inner join vd_pedido_item as vdi
on vdp.cod_pedido = vdi.cod_pedido inner join cd_cliente as cli
on cli.cod_revenda_gerado = vdp.cod_revenda inner join sg_colaborador as colab
where vdp.situacao = 80 and colab.situacao > 0 and vdp.dt_implant between '2015-01-01' and '2015-12-31'
group by vdi.cod_pedido, vdp.cod_revenda


##
select vdp.cod_revenda as 'CodRev', 
cli.nome_cliente as 'Revenda', 
cli.situacao as 'Situação', 
colab.cod_colaborador as 'Código',
colab.nome_colaborador as 'Colaborador',
(vdi.qtd*vdi.preco_venda_original) as 'Preço Revenda',
(vdi.qtd*vdi.preco_venda) as 'Preço De Venda',
date_format(vdp.dt_implant,'%m/%Y') as 'Data'
from vd_pedido as vdp inner join vd_pedido_item as vdi
on vdp.cod_pedido = vdi.cod_pedido 
inner join cd_cliente as cli
on cli.cod_revenda_gerado = vdp.cod_revenda 
inner join sg_colaborador as colab
where vdp.situacao = 80 and colab.situacao > 0 and vdp.dt_implant between '2015-01-01' and '2015-12-31'
group by vdp.cod_revenda, vdp.cod_colaborador, vdp.dt_implant




select * from vd_pedido 
where cod_colaborador= 29