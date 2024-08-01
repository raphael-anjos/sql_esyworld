/*Possui ipi Diferenciado?
ind_ipi_diferenciado = NÃO:0 ou SIM:1
Destaca Ipi?
tp_calculo_ipi = 1 destaca, 0 incide
Data: 02/08/2017
Objetivo: alterar no cadastro de produto Barracuda, para que o IPI seja Destacado, e que não seja IPI DIFERENCIADO.
Familia Comercial:
17 - Barracuda
9 - Cyberoam
*/

Update cd_produto
set ind_ipi_diferenciado = 0 , tp_calculo_ipi = 1
where cod_familia_comercial = 17 and un = 'UN' and observacao = 'Hardware';

Update cd_produto
set ind_ipi_diferenciado = 0 , tp_calculo_ipi = 1
where cod_familia_comercial = 9 and un = 'UN' and observacao = 'Hardware';

select cod_produto, desc_comercial,observacao,un,ind_ipi_diferenciado,tp_calculo_ipi 
from cd_produto
where cod_familia_comercial = 9

