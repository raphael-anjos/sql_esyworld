select c.cod_colaborador, c.nome_colaborador, g.cod_grupo, gr.nome_grupo, c.ind_acesso_total
from sg_colaborador as c join sg_grupo_colaborador as g
on c.cod_colaborador = g.cod_colaborador join sg_grupo as gr
on g.cod_grupo = gr.cod_grupo
where g.cod_empresa = 1 and g.cod_grupo = 27;


start transaction;

update sg_colaborador join sg_grupo_colaborador
on sg_colaborador.cod_colaborador = sg_grupo_colaborador.cod_colaborador
SET sg_colaborador.ind_acesso_total = 0
WHERE sg_grupo_colaborador.cod_empresa = 1 and sg_grupo_colaborador.cod_grupo = 27;


rollback;
commit;

