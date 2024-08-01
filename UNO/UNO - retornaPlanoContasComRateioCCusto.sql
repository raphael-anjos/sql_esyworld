/*Data:19/01/2018
Objetivo: Retorna todos os Planos de Contas e centro de custos
configurados com Rateio, no plano de contas.
Os planos que não possuem centro de custo informado retorna c.custo null
*/
select concat(pc.conta,'.',pc.sub_conta) as 'Conta e SubConta',
pc.desc_abrev as 'Nome da Conta', plc.ccusto as 'C. Custo', 
fcc.desc_abrev as 'Nome do Centro de Custo', plc.perc_rateio*100 as 'Percentual' 
from fn_plano_conta as pc left join fn_plano_conta_ccusto as plc 
on pc.conta = plc.conta and pc.sub_conta = plc.sub_conta
left join fn_centro_custo as fcc
on plc.ccusto = fcc.ccusto
order by 1,3;
