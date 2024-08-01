SELECT cod_empresa, cod_titulo, cod_parcela,  sum(vl_total_titulo), vl_total_baixa, situacao, dt_vencimento 
FROM fn_titulo_receber 
WHERE dt_vencimento BETWEEN '2023-06-01' AND '2023-06-01' AND cod_empresa = 1 AND cod_especie <> 97;

SELECT  fn_titulo_receber.cod_empresa,	
	 	  fn_titulo_receber.cod_titulo,
	     fn_titulo_receber.cod_parcela,
	     sum(fn_titulo_receber_hist.vl_baixa),
        fn_titulo_receber_hist.dt_referencia,
        fn_titulo_receber_hist.situacao       
FROM        
       fn_titulo_receber_hist 
		  LEFT JOIN fn_titulo_receber
		  		ON (fn_titulo_receber_hist.cod_empresa = fn_titulo_receber.cod_empresa)
		  			AND  fn_titulo_receber_hist.cod_empresa = fn_titulo_receber.cod_empresa 
					AND  fn_titulo_receber_hist.cod_titulo = fn_titulo_receber.cod_titulo 	
					AND  fn_titulo_receber_hist.cod_parcela = fn_titulo_receber.cod_parcela
					AND  fn_titulo_receber_hist.serie = fn_titulo_receber.serie 
                                                    
WHERE fn_titulo_receber.cod_empresa IN ( 1 ) 
AND  fn_titulo_receber_hist.tp_hist = 30 
AND fn_titulo_receber_hist.dt_referencia >= '2023-06-01 00:00:00' 
AND fn_titulo_receber_hist.dt_referencia <= '2023-06-01 23:59:59' 
AND (fn_titulo_receber.cod_especie <> 97 OR fn_titulo_receber.cod_especie IS NULL)
ORDER BY fn_titulo_receber_hist.dt_referencia;