/*Data: 05/07/2020
Objetivo: Guarda dados de assinaturas ativas no SaaS antes da migração para versão 2.0
A query retorna os dados das assinaturas e ativas com codigo do produto quantidade e valor unitario negociadoa
com a Esy, além de chave de ativação de cada um dos produtos, e código da revenda envolvida
*/

SELECT item.cod_plano, item.cod_produto, item.desc_comercial_servico, item.qtd, item.preco_venda,
korm.cod_ativacao_korm, korm.cod_produto, korm.subscription_id, korm.cod_revenda, korm.cod_revenda_korm
FROM sv_plano_servico_item AS item JOIN sv_plano_servico_korm AS korm
ON item.cod_plano = korm.cod_plano AND item.nr_sequencia = korm.nr_sequencia AND item.cod_produto = korm.cod_produto
WHERE korm.status = 0
ORDER BY 1
