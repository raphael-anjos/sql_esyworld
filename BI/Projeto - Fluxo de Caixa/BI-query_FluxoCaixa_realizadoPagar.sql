SELECT 
    fn_titulo_pagar_hist.cod_empresa,
    fn_titulo_pagar_hist.cod_titulo,
    fn_titulo_pagar_hist.cod_parcela,
    IF(
        fn_titulo_pagar_rateio.perc_rateio IS NULL, fn_titulo_pagar_hist.vl_baixa * 1, 
        fn_titulo_pagar_hist.vl_baixa * fn_titulo_pagar_rateio.perc_rateio) 
    AS vl_baixa,fn_titulo_pagar_hist.dt_referencia

 

FROM  
    fn_titulo_pagar_hist 
LEFT JOIN 
    fn_titulo_pagar_rateio
    ON fn_titulo_pagar_rateio.cod_titulo = fn_titulo_pagar_hist.cod_titulo 
        AND fn_titulo_pagar_rateio.cod_empresa = fn_titulo_pagar_hist.cod_empresa 
        AND fn_titulo_pagar_rateio.cod_parcela = fn_titulo_pagar_hist.cod_parcela 
        AND fn_titulo_pagar_rateio.cod_fornecedor = fn_titulo_pagar_hist.cod_fornecedor 
        AND fn_titulo_pagar_rateio.cod_especie = fn_titulo_pagar_hist.cod_especie

WHERE 
    fn_titulo_pagar_hist.cod_empresa in (1) 
AND fn_titulo_pagar_hist.tp_hist = 30 
AND fn_titulo_pagar_hist.dt_referencia >= '2023-06-01 00:00:00' 
AND fn_titulo_pagar_hist.cod_especie <> 97
ORDER BY fn_titulo_pagar_hist.dt_referencia;