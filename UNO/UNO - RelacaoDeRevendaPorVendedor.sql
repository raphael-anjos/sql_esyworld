select cd_cliente.cod_cliente as "Código Cliente", cd_cliente.cod_revenda_gerado as "Código Revenda", 
cd_cliente.nome_cliente as "Fantasia", cd_cliente.razao_social as "Razão Social", 
sg_colaborador.cod_colaborador as "Código Gerente", sg_colaborador.nome_colaborador
from cd_cliente join sg_colaborador
on cd_cliente.cod_colaborador = sg_colaborador.cod_colaborador
where sg_colaborador.cod_colaborador in (4313,2457) and cd_cliente.cod_revenda_gerado is not null;