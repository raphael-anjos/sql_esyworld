/*Data 22/03/2018
Objetivo: Ajustar a percentual de comissão dos vendedores exceto Eduardo Tadeu.
Com base no percentual definido no Cadastro do Colaborador.
*/

start transaction;
update vd_pedido as ped join vd_pedido_comissao as comiss 
on ped.cod_pedido = comiss.cod_pedido join
sg_colaborador as colab
on colab.cod_colaborador = comiss.cod_colaborador
set comiss.perc_comissao = colab.perc_comissao_vendedor
where ped.cod_empresa = 1 and comiss.tp_owner = 1 and ped.dt_implant between'2018-01-01' and now()
and comiss.perc_comissao <> colab.perc_comissao_vendedor;
commit;
rollback;


select ped.dt_implant,comiss.cod_colaborador,comiss.tp_owner,comiss.cod_pedido, ped.cod_pedido, comiss.cod_colaborador,
comiss.perc_comissao,comiss.perc_participacao
from vd_pedido as ped join vd_pedido_comissao as comiss 
on ped.cod_pedido = comiss.cod_pedido join
sg_colaborador as colab
on comiss.cod_colaborador = colab.cod_colaborador
where ped.cod_empresa = 1 and comiss.tp_owner = 1 and ped.dt_implant between'2018-01-01' and now()
and comiss.perc_comissao <> colab.perc_comissao_vendedor;

