SELECT cod_empresa, cod_titulo, cod_parcela, sum(vl_total_titulo), vl_total_baixa, situacao, dt_vencimento 
FROM fn_titulo_pagar 
WHERE dt_vencimento BETWEEN '2023-06-01' AND '2023-06-01' AND cod_empresa = 1 AND cod_especie <> 97;


SELECT 
fn_titulo_pagar.cod_empresa,
fn_titulo_pagar.cod_titulo,
fn_titulo_pagar.cod_parcela,
sum(fn_titulo_pagar_hist.vl_baixa),
fn_titulo_pagar_hist.dt_referencia
FROM fn_titulo_pagar_hist   
LEFT JOIN fn_titulo_pagar ON ( fn_titulo_pagar_hist.cod_empresa = fn_titulo_pagar.cod_empresa 
 AND fn_titulo_pagar_hist.cod_parcela = fn_titulo_pagar.cod_parcela 
 AND fn_titulo_pagar_hist.cod_titulo = fn_titulo_pagar.cod_titulo
 AND fn_titulo_pagar_hist.cod_especie = fn_titulo_pagar.cod_especie
 )
 
 
 WHERE fn_titulo_pagar.cod_empresa in (1) 
 AND fn_titulo_pagar_hist.tp_hist = 30 
 AND fn_titulo_pagar_hist.dt_referencia >= '2023-06-01 00:00:00' 
 AND fn_titulo_pagar_hist.dt_referencia <= '2023-06-01 23:59:59' 
 AND fn_titulo_pagar.cod_especie <> 97
 ORDER BY fn_titulo_pagar_hist.dt_referencia;