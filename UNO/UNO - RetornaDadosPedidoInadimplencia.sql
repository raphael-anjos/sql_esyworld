/*Data 26/02/2018
Retorna codigo de pedido, codigo da revenda nome da revenda e numero da nota fiscal emitida
De acordo com a relação dos números de pedidos.
*/
select ped.cod_pedido, ped.cod_revenda, cli.nome_cliente, cli.razao_social,
nf.nr_nota_fiscal, nf.serie
from cd_cliente as cli join vd_pedido as ped
on cli.cod_revenda_gerado = ped.cod_revenda
join vd_nota_fiscal as nf 
on ped.cod_pedido = nf.cod_pedido
where ped.cod_pedido in (65029);