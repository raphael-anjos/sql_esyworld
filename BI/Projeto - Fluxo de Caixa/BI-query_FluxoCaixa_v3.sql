SET @ano =  YEAR(CURDATE());

SELECT consolidado.*
FROM 
(SELECT 
		  Receber.dt_vencimento AS 'DataVencimentoReceber',
		  Receber.PrevReceber AS 'PrevistoReceber',
		  Receber.RealReceber AS 'RealizadoReceber',
		  Pagar.Prevpagar AS 'PrevistoPagar',
		  Pagar.Realpagar AS 'RealizadoPagar'
		  

FROM 
	(SELECT dt_vencimento, SUM(vl_total_titulo) AS 'PrevReceber',SUM(vl_total_baixa) AS 'RealReceber' 
			FROM fn_titulo_receber
			WHERE 
				cod_empresa = 1 AND 
				situacao <> 90
			GROUP BY 1) AS Receber

INNER JOIN 


	(SELECT dt_vencimento, SUM(vl_total_titulo) AS 'Prevpagar', SUM(vl_total_baixa) AS 'Realpagar'
			FROM fn_titulo_pagar
			WHERE 
				cod_empresa = 1 AND 
				situacao <> 90
			GROUP BY 1) AS Pagar
ON Receber.dt_vencimento = Pagar.dt_vencimento

			WHERE 
				YEAR(Receber.dt_vencimento) >= @ano-1 AND 
				YEAR(Receber.dt_vencimento) <= @ano) AS consolidado
