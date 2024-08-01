/*REtorna todos os pedidos dentro de um intervalo de data com situação de faturamento 
adiante para vendedor que não seja o moraes. E que possuam somente um registro na 
tabela de comissão onde na verdade deveria possuir 02 revenda e vendedor*/
select ped.cod_pedido, count(com.cod_colaborador) as qtd			
from vd_pedido as ped join vd_pedido_comissao as com
on ped.cod_pedido = com.cod_pedido
where ped.dt_implant between '2016-01-01' and '2016-12-31'
		and ped.origem = 9 and ped.situacao between 60 and 190
		and ped.cod_colaborador not in (2457,3572,4)
		#and ped.tb_preco <> 'CLIENTEFINAL'
		#and com.tp_owner = 2 and com.tp_comissao = 3 
		#and com.perc_comissao != 0.877500 
group by ped.cod_pedido
having qtd = 1	;

#Comissao de revenda com percentual errado
tp_owner = 2 and tp_comissao = 3 and perc_comissao = 0.008775

select *
from vd_pedido_comissao as com
where com.tp_owner = 2 and com.tp_comissao = 3 and com.cod_pedido = 84410
and com.perc_comissao != 0.877500 and 	

select *
from vd_pedido_comissao
where cod_pedido = 76829

select *
from vd_pedido
where cod_pedido IN (80481,80483,80549,80686,81804,81997,82106,82843,83639)		
