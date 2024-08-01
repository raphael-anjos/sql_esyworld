
####CONTAS A RECEBER

/*Retorana os titulos criado no contas a receber
Esses dados são tratados como sendo os recebimentos previstos
Utilizar o valor do titulo e dt_vencimento*/
SELECT cod_empresa, cod_titulo, cod_parcela, cod_pedido, cod_nota_fiscal, serie, cod_cliente, vl_total_titulo, vl_total_baixa, situacao, dt_vencimento 
FROM fn_titulo_receber 
WHERE dt_vencimento BETWEEN '2023-01-01' AND '2023-12-31' AND cod_empresa = 1;



/*Retorna os dados da fn_titulo_receber_hist
Considerar o valor de fn_titulo_pagar_hist.vl_baixa como sendo o recebido
E a data de recebimento fn_titulo_pagar_hist.dt_referencia.
*/

SELECT  fn_titulo_receber.cod_empresa,	
		  fn_titulo_receber.cod_titulo,
		  fn_titulo_receber.cod_parcela,
		  fn_titulo_receber_hist.tp_hist,
        fn_titulo_receber_hist.vl_baixa,
        fn_titulo_receber_hist.vl_juros,
        fn_titulo_receber_hist.vl_multa,
        fn_titulo_receber_hist.vl_total,
        fn_titulo_receber_hist.dt_implant,
        fn_titulo_receber_hist.dt_referencia,
        fn_titulo_receber_hist.situacao       
       FROM        
            fn_titulo_receber_hist LEFT JOIN cd_forma_pagto
                                 ON ( cd_forma_pagto.cod_forma_pagto = fn_titulo_receber_hist.cod_forma_pagto )
                               LEFT JOIN cd_banco
                                 ON ( cd_banco.cod_banco = fn_titulo_receber_hist.cod_banco
                                AND cd_banco.cod_empresa = fn_titulo_receber_hist.cod_empresa ),
        fn_titulo_receber LEFT JOIN fn_especie
                                 ON ( fn_especie.cod_especie = fn_titulo_receber.cod_especie )
                          LEFT JOIN fn_centro_custo
                                 ON ( fn_centro_custo.ccusto = fn_titulo_receber.ccusto )
                          LEFT JOIN fn_plano_conta
                                 ON ( fn_plano_conta.conta = fn_titulo_receber.conta
                                AND fn_plano_conta.sub_conta = fn_titulo_receber.sub_conta )
                          LEFT JOIN vd_pedido
                                 ON ( vd_pedido.cod_pedido = fn_titulo_receber.cod_pedido
                                AND vd_pedido.cod_empresa = fn_titulo_receber.cod_empresa )
                          LEFT JOIN sg_colaborador
                                 ON ( sg_colaborador.cod_colaborador = vd_pedido.cod_colaborador )
                          LEFT JOIN vd_nota_fiscal
                                 ON ( vd_nota_fiscal.cod_nota_fiscal = fn_titulo_receber.cod_nota_fiscal )
                          LEFT JOIN sv_plano_servico
                                 ON ( sv_plano_servico.cod_plano = vd_nota_fiscal.cod_plano
                                 AND sv_plano_servico.cod_empresa = vd_nota_fiscal.cod_empresa )                                  
WHERE fn_titulo_receber.cod_empresa IN ( 1 ) 
AND  fn_titulo_receber_hist.cod_empresa = fn_titulo_receber.cod_empresa 
AND  fn_titulo_receber_hist.cod_titulo = fn_titulo_receber.cod_titulo 
AND  fn_titulo_receber_hist.cod_parcela = fn_titulo_receber.cod_parcela 
AND  fn_titulo_receber_hist.serie = fn_titulo_receber.serie 
AND  fn_titulo_receber_hist.tp_hist = 30 
AND fn_titulo_receber_hist.dt_referencia >= '2023-01-01 00:00:00' 
AND fn_titulo_receber_hist.dt_referencia <= '2023-12-31 23:59:59' 
AND ( fn_titulo_receber.cod_especie <> 97 OR  fn_titulo_receber.cod_especie is null ) 
ORDER BY fn_titulo_receber_hist.dt_referencia 


####CONTAS A PAGAR

/*Retorana os titulos criado no contas a pagar
Esses dados são tratados como sendo os pagamnetos que devemos realizar previstos
Utilizar o valor do titulo e dt_vencimento*/

SELECT cod_empresa, cod_titulo, cod_parcela, vl_total_titulo, vl_total_baixa, situacao, dt_vencimento 
FROM fn_titulo_pagar 
WHERE dt_vencimento BETWEEN '2023-01-01' AND '2023-12-31' AND cod_empresa = 1;

/*Retorna os dados da fn_titulo_pagar_hist
Considerar o valor de fn_titulo_pagar_hist.vl_baixa como sendo o valor pago
E a data de pagamento fn_titulo_pagar_hist.dt_referencia.
*/
SELECT 
fn_titulo_pagar.cod_empresa,
fn_titulo_pagar.cod_titulo,
fn_titulo_pagar.cod_parcela,
fn_titulo_pagar_hist.tp_hist,
fn_titulo_pagar_hist.vl_baixa,
fn_titulo_pagar_hist.vl_juros,
fn_titulo_pagar_hist.vl_multa,
fn_titulo_pagar_hist.vl_total,
fn_titulo_pagar_hist.dt_implant,
fn_titulo_pagar_hist.dt_referencia,
fn_titulo_pagar_hist.situacao
FROM fn_especie, fn_titulo_pagar  
LEFT JOIN cd_fornecedor 
ON ( fn_titulo_pagar.cod_fornecedor = cd_fornecedor.cod_fornecedor ) 
LEFT JOIN fn_plano_conta 
ON ( fn_plano_conta.conta = fn_titulo_pagar.conta AND fn_plano_conta.sub_conta = fn_titulo_pagar.sub_conta ) 
LEFT JOIN sg_colaborador 
ON ( fn_titulo_pagar.cod_colaborador = sg_colaborador.cod_colaborador ) 
LEFT JOIN fn_area 
ON (fn_area.area = fn_titulo_pagar.area)
LEFT JOIN fn_titulo_pagar_rateio ON ( fn_titulo_pagar_rateio.cod_titulo = fn_titulo_pagar.cod_titulo 
 AND fn_titulo_pagar_rateio.cod_empresa = fn_titulo_pagar.cod_empresa 
 AND fn_titulo_pagar_rateio.cod_parcela = fn_titulo_pagar.cod_parcela 
 AND fn_titulo_pagar_rateio.cod_fornecedor = fn_titulo_pagar.cod_fornecedor 
 AND fn_titulo_pagar_rateio.cod_especie = fn_titulo_pagar.cod_especie ) 
 LEFT JOIN fn_centro_custo ON ( fn_centro_custo.ccusto = fn_titulo_pagar_rateio.ccusto )
 LEFT JOIN fn_centro_custo fnCCustoPagar 
 ON ( fnCCustoPagar.ccusto = fn_titulo_pagar.ccusto ),fn_titulo_pagar_hist  
 LEFT JOIN cd_banco 
 ON ( cd_banco.cod_banco = fn_titulo_pagar_hist.cod_banco 
 		AND cd_banco.cod_empresa = fn_titulo_pagar_hist.cod_empresa ) 
LEFT JOIN cd_forma_pagto 
ON ( cd_forma_pagto.cod_forma_pagto = fn_titulo_pagar_hist.cod_forma_pagto ) 
LEFT JOIN fn_cheque_terceiros 
ON ( fn_titulo_pagar_hist.cod_cheque = fn_cheque_terceiros.cod_cheque ) 
 WHERE fn_titulo_pagar.cod_empresa in (1) 
 AND fn_especie.cod_especie = fn_titulo_pagar.cod_especie  
 AND fn_titulo_pagar_hist.tp_hist = 30 
 AND fn_titulo_pagar_hist.cod_empresa = fn_titulo_pagar.cod_empresa  
 AND fn_titulo_pagar_hist.cod_titulo = fn_titulo_pagar.cod_titulo  
 AND fn_titulo_pagar_hist.cod_parcela = fn_titulo_pagar.cod_parcela  
 AND fn_titulo_pagar_hist.cod_fornecedor = fn_titulo_pagar.cod_fornecedor  
 AND fn_titulo_pagar_hist.cod_especie = fn_titulo_pagar.cod_especie  
 AND fn_titulo_pagar_hist.dt_referencia >= '2023-01-01 00:00:00' 
 AND fn_titulo_pagar_hist.dt_referencia <= '2023-12-31 23:59:59' 
 AND fn_titulo_pagar.cod_especie <> 97 ORDER BY fn_titulo_pagar_hist.dt_referencia
 
 
/*QUERY A SER EVOLUÍDA SIMPLIFICADA*/
SELECT cod_empresa, cod_titulo, cod_parcela, tp_hist, vl_baixa, vl_juros, vl_multa, vl_total, dt_implant, situacao  
FROM fn_titulo_receber_hist 
WHERE cod_empresa = 1 AND dt_implant BETWEEN '2023-01-01' AND '2023-12-31' AND situacao = 30;



SELECT cod_empresa, cod_titulo, cod_parcela, tp_hist, vl_baixa, vl_juros, vl_multa, vl_total, dt_implant, situacao 
FROM fn_titulo_pagar_hist 
WHERE cod_empresa = 1 AND dt_implant BETWEEN '2023-01-01' AND '2023-12-31' AND situacao = 30;
 
 
 

