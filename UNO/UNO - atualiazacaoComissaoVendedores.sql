

select distinct(colab.cod_colaborador),colab.nome_colaborador,coms.*
from vd_pedido_comissao as coms join vd_pedido as ped 
on coms.cod_pedido = ped.cod_pedido
join sg_colaborador as colab
on coms.cod_colaborador = colab.cod_colaborador
where ped.dt_alteracao between '2017-07-01' and '2017-12-21'
and coms.tp_owner = 1 and coms.cod_colaborador not in (5794,6044,5871,4,4312,5359);

start transaction;
update vd_pedido_comissao as coms join vd_pedido as ped
on coms.cod_pedido = ped.cod_pedido
set coms.perc_comissao = 0.01
where ped.dt_alteracao between '2017-07-01' and '2017-12-21'
and coms.tp_owner = 1 and coms.perc_comissao <= 0.005 
and coms.cod_colaborador not in (5794,6044,5871,4,4312,5359);
commit;


select *
from sg_colaborador
where cod_colaborador in (5359, 2525,4312,4313,3797),

##coms.cod_colaborador = 4313;

#coms.cod_colaborador not in (5794,6044,5871,4);