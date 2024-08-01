/*Data: 2018-08-02
Objetivo: Replicar as configurações de Tipo de Usuário e Grupo.
Observações: O cadastro básico do Usuário novo deve ser realizado via Sistema
Data Atualização: 2019-03-21
Replica situações de Pedido e Oportunidades
*/
start transaction;

set @colaboradorReferencia = 6636;
set @colaboradorNovo = 6797;
#copia o Tipo de Colaborador
delete from sg_tp_colaborador
where cod_colaborador = @colaboradorNovo;

insert into sg_tp_colaborador (cod_colaborador, tp_colaborador)
select @colaboradorNovo, tp_colaborador
	from sg_tp_colaborador
		where cod_colaborador = @colaboradorReferencia;

#copia o Grupo de Usuário		
delete from sg_grupo_colaborador
where cod_colaborador = @colaboradorNovo;

insert into sg_grupo_colaborador (cod_grupo,cod_colaborador,cod_empresa)
select cod_grupo, @colaboradorNovo, cod_empresa
	from sg_grupo_colaborador
		where cod_colaborador = @colaboradorReferencia;	

#copia o Status Atendimento				
delete from at_status_colaborador
where cod_colaborador = @colaboradorNovo;

insert into at_status_colaborador (cod_status,cod_colaborador)
select cod_status, @colaboradorNovo
	from at_status_colaborador
	where cod_colaborador = @colaboradorReferencia;	

#copia o Situação do Pedido
delete from vd_ponto_controle_colaborador
where cod_colaborador = @colaboradorNovo;

insert into vd_ponto_controle_colaborador (cod_controle,cod_colaborador)
select cod_controle, @colaboradorNovo
	from vd_ponto_controle_colaborador
	where cod_colaborador = @colaboradorReferencia;	
		
rollback;
commit;