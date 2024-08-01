Relatório de Inadimplência

#fn_titulo_receber
	cod_empresa = 1
	cod_pedido
	vl_total_titulo
	vl_total_baixa
	dt_vencimanto
	situacao
	
#vd_pedido

#vd_pedido_comissão



select cod_pedido, cod_titulo, cod_parcela, sum(vl_total_titulo) as 'total', 
sum(vl_total_baixa) as 'baixa',
(vl_total_titulo - vl_total_baixa) as 'saldo sem juros'
from fn_titulo_receber
where cod_empresa = 1 and origem = 1 and situacao not in (30,35,90,105)
and dt_vencimento between 
'2017-07-01' and '2017-12-31' 
group by cod_pedido,cod_titulo, cod_parcela;


select *
from fn_titulo_receber
where cod_titulo = 203484 and cod_parcela = 1;


*************************************************************************
************************ULTIMA UTILIZADA*********************************
*************************************************************************

select rec.cod_pedido, rec.cod_titulo, rec.cod_parcela, 
sum(rec.vl_total_titulo) as 'total', sum(rec.vl_total_baixa) as 'baixa',
(rec.vl_total_titulo - rec.vl_total_baixa) as 'saldo sem juros'

from fn_titulo_receber as rec join vd_pedido as ped
on rec.cod_pedido = ped.cod_pedido


where rec.cod_empresa = 1 and rec.origem = 1 and 
rec.situacao not in (30,35,90,105) and 
ped.cod_colaborador not in (4,5794,5871,6044) and
rec.dt_vencimento between '2017-07-01' and '2017-12-31' 
group by rec.cod_pedido,rec.cod_titulo, rec.cod_parcela;

****************************************************************************
**************************SEGUNDA FASE**************************************
****************************************************************************

select comis.cod_pedido, comis.cod_colaborador, colab.nome_colaborador,
(comis.perc_participacao * 100) as participação
from vd_pedido_comissao as comis join sg_colaborador as colab
on comis.cod_colaborador = colab.cod_colaborador

where comis.tp_owner = 1 and
comis.cod_pedido in (94796,95456,96702,98372,98550,99212,99596,100528,
100648,101361,101437,101501,106731,106785,106811,106837,106957,106985,
101598,102035,102120,102224,102250,102391,102729,102733,102751,102910,
102921,102980,103046,103085,103113,103118,103539,103632,103810,103814,
103969,104005,104128,104305,104347,104352,104475,104545,104561,104643,
104806,104873,104999,105287,105300,105337,105343,105369,105458,105459,
105460,105476,105488,105543,105616,105618,105620,105622,105645,105750,
105827,105836,105838,105989,105991,106130,106345,106372,106415,106717,
107101,107123,107174,107185,107198);



