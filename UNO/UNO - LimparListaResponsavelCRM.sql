/*Data: 2018-05-22
Objetivo: limpar a lista que estava sendo apresentada no CRM nos campos Responsaveis
e Participantes.
*/ECommerceAfiliados

/*Remove o tipo de colaborador para todos os colaboradores sem ID.USUARIO*/
delete from sg_tp_colaborador
where cod_colaborador in (select cod_colaborador
								  from sg_colaborador
								  where id_usuario is null);

/*Define todo colaborador sem id.usuario como sendo do tipo Revenda*/
insert into sg_tp_colaborador (cod_colaborador, tp_colaborador)
select cod_colaborador, '4'
from sg_colaborador 
where id_usuario is null;












