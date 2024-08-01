/*Data: 17/12/2018
Objetivo: Retorna nome Colaborador cod_pedido data Faturamento
Relatório gerado para verificar se estas comissões foram pagas aos vendedores
*/

select nf.cod_colaborador, colab.nome_colaborador, nf.cod_pedido, nf.dt_emissao
from vd_pedido as ped join vd_nota_fiscal as nf
on ped.cod_pedido = nf.cod_pedido and ped.cod_empresa = nf.cod_empresa
join sg_colaborador as colab
on nf.cod_colaborador = colab.cod_colaborador
where ped.cod_pedido in (108783,109566,110190,111572,111569,111568,111571,114406,116633,
								 107486,107335,108005,118749)
order by 2;
