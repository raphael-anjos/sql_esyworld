select colab.cod_colaborador as 'codigo Revenda', 
		 colab.nome_colaborador as 'nome Revenda', 
		 ped.cod_pedido as 'codigo pedido', 
		 ped.vl_total_pedido as 'total pedido',
		 cli.cod_cliente as 'codigo cliente',
		 cli.nome_cliente as 'nome cliente',
		 cli.razao_social as 'Razão Social',
		 ped.dt_alteracao as 'data'
from sg_colaborador as colab inner join vd_pedido as ped
on colab.cod_colaborador = ped.cod_revenda
inner join cd_cliente as cli
on cli.cod_cliente = ped.cod_cliente
where ped.situacao in (70,80) and cli.cod_cliente not in (121726,112328,70248)
order by 4 DESC
limit 200;
