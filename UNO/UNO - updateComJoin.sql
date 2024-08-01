##Esboço de update com join
update sg_colaborador join sg_tp_colaborador
on sg_colaborador.cod_colaborador = sg_tp_colaborador.cod_colaborador
SET sg_colaborador.situacao = 1
WHERE sg_tp_colaborador.tp_colaborador = 4;