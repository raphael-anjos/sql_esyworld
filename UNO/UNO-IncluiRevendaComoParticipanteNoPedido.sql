/*Data: 2018-09-12
Objetivo: Inserir a revenda como Participante no pedido quando isso não ocorre.
Paliativo para bug identificado em alguns pedidos originados da loja.
*/

set @pedido = 117239;

insert into vd_pedido_comissao (cod_empresa, cod_pedido, tp_owner, cod_colaborador, 
tp_item,tp_comissao, perc_comissao, perc_vdr0020, perc_participacao, cod_comissao)

select 1,cod_pedido,2,cod_revenda,1,3,0.8875,1,1,null
from  vd_pedido
where cod_pedido = @pedido;

