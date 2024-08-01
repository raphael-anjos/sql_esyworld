/*Simula aplicação de Desconto de 15%*/
select tb_preco, cod_produto, preco_unit,
(preco_unit - (preco_unit * 0.15)) as "PREÇO BLACK"
from cd_preco_item
where tb_preco = 'Black30_2017';

/*Aplica o desconto de 15% nas lista
update cd_preco_item
set preco_unit = (preco_unit - (preco_unit * 0.15))
where tb_preco = 'Black40_2017';*/

/*Retorna as listas de Preços Black Friday*/
select *
from cd_preco_item
where tb_preco in ('Black30_2017','Black35_2017','Black40_2017')
order by cod_produto;