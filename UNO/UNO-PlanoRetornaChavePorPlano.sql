set @plano = 10;

select capa.cod_plano, capa.nome_cliente, capa.nome_plano,
item.cod_produto, item.preco_venda, item.qtd, (item.preco_venda*item.qtd) as total,
korm.cod_ativacao_korm, korm.subscription_id, korm.`status`

from sv_plano_servico as capa join sv_plano_servico_item as item
on capa.cod_plano = item.cod_plano
join sv_plano_servico_korm as korm
on item.cod_plano = korm.cod_plano and item.nr_sequencia = korm.nr_sequencia
where korm.cod_plano = @plano;
