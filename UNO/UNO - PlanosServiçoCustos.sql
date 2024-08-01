/*Atualiza o custo do na tabela plano de serviço item [sv_plano_servico_item]
com referência no custo informado no cadastro de produto
*/
start transaction;
update sv_plano_servico_item join cd_produto_empresa
on sv_plano_servico_item.cod_produto = cd_produto_empresa.cod_produto
SET sv_plano_servico_item.vl_custo_total = cd_produto_empresa.vl_custo_total
WHERE sv_plano_servico_item.cod_produto like 'KL%';
commit;


/*Retorna os itens com preço de custo dos planos 
Quando a situação for ativo[10] e o tipo de plano [7-SaaS - Mensal Kaspersky, 8-LMP - Mensal Kaspersky]
*/
select cod_plano as 'plano', cod_produto as 'sku', qtd as 'quantidade', 
preco_venda as 'venda unit', vl_custo_total as 'custo unit', 
qtd*preco_venda as 'preco de venda total', 
qtd*vl_custo_total as 'preco de Custo total'
from sv_plano_servico_item
where cod_plano in (select cod_plano 
					from sv_plano_servico
					where situacao = 10 and cod_tp_plano in (7,8))