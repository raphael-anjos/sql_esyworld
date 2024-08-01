/*Data: 29/12/2016
Objetivo: Auxiliar a Mariana para não gerar titulo no contas a pagar indevidamente
O Script abaixo retorna codigo do titulo numero da parcela codigo do pedido, codigo do cliente,
dt_vencimento do titulo, Para titulos que foram estornados e baixados novamente, somente pedidos
que foram faturados com cliente final pois são os que geram pagamento de comissão dentro do intevalo
de data de vencimento passado as variaveis @dt_venc_ini e @dt_venc_fim
ped.origem [9 - Faturamento Cliente Final, 10 - Faturamento Revenda]
fnr.situacao = 30 Pago
fnh.tp_hist = 90 Estorno
*/

#Variaveis para informar datas formato AAAA-mm-dd
set @dt_venc_ini ='2016-01-01';
set @dt_venc_fim ='2016-12-31';

select fnr.cod_titulo, fnr.cod_parcela, fnr.cod_pedido,ped.origem, ped.cod_revenda,
		 fnr.situacao, fnr.dt_vencimento, fnh.tp_hist
from vd_pedido as ped inner join fn_titulo_receber as fnr
on ped.cod_pedido = fnr.cod_pedido
inner join fn_titulo_receber_hist as fnh
on fnr.cod_empresa = fnh.cod_empresa and fnr.cod_titulo = fnh.cod_titulo
where fnr.dt_vencimento between @dt_venc_ini and  @dt_venc_fim
		and fnh.tp_hist = 90 and fnr.situacao = 30 and ped.origem = 9
		order by 1;
		
		
set @dt_venc_ini ='2016-01-01';
set @dt_venc_fim ='2016-12-31';

select fnr.cod_titulo, fnr.cod_parcela, fnr.cod_pedido,ped.cod_revenda,
		 cli.nome_cliente,cli.razao_social,fnr.dt_vencimento
from cd_cliente as cli inner join vd_pedido as ped 
on cli.cod_revenda_gerado = ped.cod_revenda
inner join fn_titulo_receber as fnr
on ped.cod_pedido = fnr.cod_pedido
inner join fn_titulo_receber_hist as fnh
on fnr.cod_empresa = fnh.cod_empresa and fnr.cod_titulo = fnh.cod_titulo
where fnr.dt_vencimento between @dt_venc_ini and  @dt_venc_fim
		and fnh.tp_hist = 90 and fnr.situacao = 30 and ped.origem = 9
		group by fnr.cod_titulo, fnr.cod_parcela
		order by 1;