/*set @dt_inicio='2016-01-01';
set @dt_final='2016-01-30';

select ped.cod_revenda,item.cod_pedido, sum((item.preco_venda_original*item.qtd)) as PrecoRevenda
from vd_pedido_item as item inner join vd_pedido as ped
on item.cod_pedido = ped.cod_pedido
inner join vd_nota_fiscal as nf
on nf.cod_pedido = ped.cod_pedido
where ped.situacao >= 70 and nf.dt_emissao between @dt_inicio and @dt_final
group by item.cod_pedido
order by 1;

select ped.cod_revenda, cli.cnpj,item.cod_pedido,sum((item.preco_venda_original*item.qtd)) as PrecoRevenda
from sg_colaborador as colab inner join cd_cliente as cli
on colab.cod_colaborador = cli.cod_colaborador
join vd_pedido as ped
on cli.cod_cliente = ped.cod_cliente
join vd_pedido_item as item 
on item.cod_pedido = ped.cod_pedido
inner join vd_nota_fiscal as nf
on nf.cod_pedido = ped.cod_pedido
where ped.situacao >= 70 and nf.dt_emissao between @dt_inicio and @dt_final
group by ped.cod_revenda #item.cod_pedido
order by 1;
*/
select cli_rev.cod_cliente,cli_rev.cod_revenda_gerado, colab_rev.cnpj, upper(colab_rev.nome_colaborador),
camp.desc_abrev as Campanha, cli_rev.cod_colaborador,colab_vend.nome_colaborador
from sg_colaborador  as colab_rev  inner join cd_cliente as cli_rev
on colab_rev.cod_colaborador = cli_rev.cod_revenda_gerado
join sg_colaborador as colab_vend
on colab_vend.cod_colaborador = cli_rev.cod_colaborador
left join cd_campanha as camp
on camp.cod_campanha = cli_rev.cod_campanha
where cli_rev.situacao <> 0
order by 2;
#where cli_rev.cod_revenda_gerado = 1944;



