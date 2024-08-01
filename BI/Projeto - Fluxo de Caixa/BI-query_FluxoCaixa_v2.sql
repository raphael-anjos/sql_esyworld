########################################## Contas a Receber ###############################################
#########################################################################################################
#########################################################################################################
SET @ano =  YEAR(CURDATE());
SELECT

	prevReceber.vl_total_titulo AS 'PrevReceber',
	prevReceber.dt_vencimento AS 'DataVencimento'
	
FROM fn_titulo_receber AS prevReceber

WHERE 
	YEAR(prevReceber.dt_vencimento) >= @ano-1 AND 
	YEAR(prevReceber.dt_vencimento) <= @ano AND 
	prevReceber.situacao <> 90
GROUP BY prevReceber.cod_titulo 


SELECT 
	realReceber.vl_baixa AS 'RealReceber',
	realReceber.dt_implant AS 'DataBaixa'
FROM fn_titulo_receber_hist AS realReceber
WHERE 
	YEAR(dt_implant) >= @ano-1 AND 
	YEAR(dt_implant) <= @ano
GROUP BY realReceber.cod_titulo

########################################## Contas a Pagar ###############################################
#########################################################################################################
#########################################################################################################

SELECT

	prevReceber.vl_total_titulo AS 'PrevPagar',
	prevReceber.dt_vencimento AS 'DataVencimento'
	
FROM fn_titulo_pagar AS prevReceber

WHERE 
	YEAR(prevReceber.dt_vencimento) >= @ano-1 AND 
	YEAR(prevReceber.dt_vencimento) <= @ano AND 
	prevReceber.situacao <> 90
GROUP BY prevReceber.cod_titulo 


SELECT 
	realReceber.vl_baixa AS 'RealPagar',
	realReceber.dt_implant AS 'DataBaixa'
FROM fn_titulo_pagar_hist AS realReceber
WHERE 
	YEAR(dt_implant) >= @ano-1 AND 
	YEAR(dt_implant) <= @ano
GROUP BY realReceber.cod_titulo