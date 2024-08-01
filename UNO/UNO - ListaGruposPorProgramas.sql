#Retorno os programas associados ao grupo de usuário
set @nomeDoGrupo = 'canais';
select spr.programa, spr.nome_programa_pt_BR, grupo.cod_grupo, grupo.nome_grupo 
from sg_programa as spr inner join sg_grupo_programa as sgp
on spr.programa = sgp.programa
inner join sg_grupo as grupo
on sgp.cod_grupo = grupo.cod_grupo
where grupo.nome_grupo = @nomeDoGrupo;

#Retorna os grupos associados a um programa
set @cod_programa = 'CDW0101GF';
select spr.programa, spr.nome_programa_pt_BR, grupo.cod_grupo, grupo.nome_grupo 
from sg_programa as spr inner join sg_grupo_programa as sgp
on spr.programa = sgp.programa
inner join sg_grupo as grupo
on sgp.cod_grupo = grupo.cod_grupo
where sgp.programa = @cod_programa;



select 