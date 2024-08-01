/*Lista Todos os Usuários da Esyworld*/
select colab.cod_colaborador as 'Código',colab.id_usuario as 'User',
colab.nome_colaborador as 'Nome Colaborador',
CASE
    WHEN colab.situacao = 0 THEN 'Inativo'
    WHEN colab.situacao = 1 THEN 'Ativo'
    WHEN colab.situacao = 2 THEN 'Férias'
    WHEN colab.situacao = 3 THEN 'Afastado/Suspenso'
    WHEN colab.situacao = 4 THEN 'Bloqueado'
    WHEN colab.situacao = 5 THEN 'Demitido'
    WHEN colab.situacao = 9 THEN 'Morte'
    ELSE 'Indefinido'
END as 'Situação',
CASE WHEN colab.ind_acesso_total = 1 THEN 'Acesso Interno/Externo'
    WHEN colab.ind_acesso_total = 0 THEN 'Acesso Interno'
    ELSE 'Indefinido'
    END as 'Acesso Interno/Externo',
colab.hora_acesso_inicial as 'Inicio',
colab.hora_acesso_final as 'Final',
access.dt_login as 'Data Login',
access.ip as 'Ip Origem'
from sg_colaborador as colab left join sg_colaborador_acesso as access
on colab.cod_colaborador = access.cod_colaborador
where colab.id_usuario is not null 
		and colab.nome_colaborador like '%Esyworld';
	
/*#Libera acesso ip externo e horário ilimitado para todos os colaboradores da Esyworld
update sg_colaborador
set ind_acesso_total = 1, hora_acesso_inicial ='08:00:00', hora_acesso_final ='00:00:00'
where situacao = 1 and id_usuario is not null and nome_colaborador like '%- Esyworld';
*/											
											

