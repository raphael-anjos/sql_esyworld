
Start Transaction;
set @pedido = 104967;
set @revenda = (select cod_revenda from vd_pedido where cod_pedido = @pedido);

select *
from vd_pedido_comissao
where cod_pedido in (@pedido);

insert into vd_pedido_comissao (cod_empresa,cod_pedido,tp_owner,cod_colaborador,tp_item,tp_comissao,perc_comissao,perc_vdr0020,perc_participacao)
values (1,@pedido,2,@revenda,1,3,0.8875,0.5,1);

select *
from vd_pedido_comissao
where cod_pedido in (@pedido);

rollback;
commit;