/*Data 14/09/2017
Retorna a lista de perço por lista de preço e Familia Comercial do Produto
*/

select prod.cod_produto as 'Código', prod.desc_comercial as 'Descrição', 
pre.tb_preco as 'Tabela de Preço',prod.moeda as 'Moeda de Venda',
pre.preco_unit as 'Pr.Unit', prod.observacao as 'Observação'
from cd_produto as prod join cd_preco_item as pre
on prod.cod_produto = pre.cod_produto
where prod.cod_familia_comercial = 17 and pre.tb_preco = 'BARRACUDA'