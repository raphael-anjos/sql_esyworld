/*Data: 2023-08-22
Objetivo: Incluir no vd_pedido_comissão a revenda envolvida no pedido.
Passando como parametro os números dos pedidos.
*/

INSERT vd_pedido_comissao (cod_empresa,cod_pedido,tp_owner,cod_colaborador,tp_item,tp_comissao,perc_comissao,perc_vdr0020,perc_participacao)
SELECT 1 AS cod_empresa,  
vd_pedido_comissao.cod_pedido AS cod_pedido,
2 AS tp_owner, 
vd_pedido.cod_revenda AS cod_colaborador,
1 AS tp_item,
3 AS tp_comissao,
0 AS perc_comissao,
1 AS perc_vdr0020,
1 AS perc_participacao
FROM vd_pedido LEFT JOIN vd_pedido_comissao
ON vd_pedido.cod_pedido = vd_pedido_comissao.cod_pedido
WHERE vd_pedido_comissao.cod_pedido IN (181726);

