select cod_cliente, cod_revenda_gerado, nome_cliente, razao_social
from cd_cliente
where cod_revenda_gerado is not null and cod_revenda_gerado > 0
order by 2;