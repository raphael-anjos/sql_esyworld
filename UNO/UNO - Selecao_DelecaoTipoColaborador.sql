select col.cod_colaborador, col.id_usuario, col.nome_colaborador, col.situacao
from sg_colaborador as col join sg_tp_colaborador as tpcol
on col.cod_colaborador = tpcol.cod_colaborador
join sg_classificacao_colaborador as clascol
on tpcol.tp_colaborador = clascol.tp_colaborador
where clascol.descricao = 'Comprador'

/*1 - Operador/Usuário, 2 - Vendedor, 3 - Comprador, 4 - Revenda, 5 - Distribuidor
6 - Motoqueiro/Motorista, 7 - Terceiro, 40 - Vendedor PDV, 41 - Admin PDV, 42 - Pré-Venda,
50 - PDA*/
set @codcolab = 2262 ;
set @tpcolab = 3;
delete from sg_tp_colaborador
where cod_colaborador = @codcolab
		and tp_colaborador = @tpcolab;
	


		
