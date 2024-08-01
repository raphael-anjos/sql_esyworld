/*Data: 2019-01-23
Objetivo: Retorna os planos de serviços Faturados dentro de um determinado período.
Não temos um relário no ERP que Retorne esta Informação.
*/

set @dataInicial = '2018-12-01'  ;
set @dataFinal = '2018-12-31';

select plano.cod_plano, plano.nome_plano, plano.cod_cliente, plano.nome_cliente,
titulo.cod_titulo, titulo.cod_parcela,
nota.nr_nota_fiscal, nota.cod_colaborador, nota.desc_colaborador, nota.dt_emissao,
nota.observacao, nota.vl_total_nota_Fiscal, nota.vl_total_liquido, nota.vl_base_inss, 
nota.vl_base_iss, nota.vl_total_iss
from sv_plano_servico as plano join vd_nota_fiscal as nota
on plano.cod_plano = nota.cod_plano
join fn_titulo_receber as titulo
on nota.cod_nota_fiscal = titulo.cod_nota_fiscal
where nota.dt_emissao between @dataInicial and @dataFinal;
