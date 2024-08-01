select cod_pedido, cod_colaborador, cod_cliente, cod_revenda
from vd_pedido
where dt_implant <= '2015-10-31' and cod_revenda is null and cod_cliente IN (select cod_cliente from cd_cliente where cod_revenda_gerado > 0)

select distinct(cod_cliente) as codigoCliente , cod_revenda
from vd_pedido
where dt_implant <= '2015-10-31' and cod_cliente IN (select cod_cliente from cd_cliente where cod_revenda_gerado > 0)and cod_revenda =0 or cod_revenda is null
order by cod_cliente

##retorna codigo do cliente e codigo de revenda quando o código de revenda é null
select distinct(cod_cliente) as codigo, cod_revenda
from vd_pedido
where cod_revenda is null
order by cod_cliente

##c
cod_colaborador_revenda : Códio de Revenda padrao.
select *
from cd_cliente
where cod_cliente in (51,41)


select cod_cliente, cod_revenda_gerado
from cd_cliente
where cod_revenda_gerado >0

select cod_cliente, cod_colaborador_revenda
from cd_cliente
where cod_colaborador_revenda is null and cod_revenda_gerado = 0
order by cod_colaborador_revenda

select cod_pedido, cod_cliente, cod_revenda
from vd_pedido
where dt_implant < '2011-12-31' and cod_revenda is null or cod_revenda = 0




select count(cod_pedido)
from vd_pedido
where cod_revenda is null and dt_implant < '2011-12-31'

select count(cod_pedido)
from vd_pedido
where cod_revenda = 0 and dt_implant < '2011-12-31'