SELECT 
    cod_empresa, cod_titulo, 
    cod_parcela,  
    (vl_total_titulo - vl_total_baixa) as vl_total_titulo, 
    situacao, 
    dt_vencimento

FROM 
    fn_titulo_receber 
WHERE 
    dt_vencimento >= '2023-06-01' AND cod_empresa = 1 AND cod_especie <> 97;