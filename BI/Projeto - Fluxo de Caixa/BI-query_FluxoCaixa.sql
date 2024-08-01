SET @ano =  YEAR(CURDATE());
SELECT 
		SUM(ctpagar.vl_total_titulo)*-1 AS 'TotalTitulo',
		sum(ctpagar.vl_total_baixa)*-1 AS 'TotalBaixa',
		ctpagar.situacao AS 'SituacaoTitulo',
		ctpagar.dt_vencimento AS 'DataVencimento',
		ctpagar.dt_prorrogada AS 'DataProrrogada'
		
FROM
fn_titulo_pagar AS ctpagar
WHERE YEAR(dt_vencimento) >= @ano-1 AND YEAR(dt_vencimento) <= @ano
GROUP BY DataVencimento;

SET @ano =  YEAR(CURDATE());
SELECT 
		ctreceber.vl_total_titulo AS 'TotalTitulo',
		ctreceber.vl_total_baixa AS 'TotalBaixa',
		ctreceber.situacao AS 'SituacaoTitulo',
		ctreceber.dt_vencimento AS 'DataVencimento',
		ctreceber.dt_prorrogada AS 'DataProrrogada'
		
FROM
fn_titulo_receber AS ctreceber
WHERE YEAR(dt_emissao) <= @ano AND ctreceber.dt_vencimento = '2023-01-02'

############# Esta query soma o valor total do titulo e agrupa pelo código do mesmo
############ Assim podemos saber o valor total a receber por fornecedor
SET @ano =  YEAR(CURDATE());
SELECT 
		SUM(ctreceber.vl_total_titulo) AS 'TotalTitulo',
		sum(ctreceber.vl_total_baixa) AS 'TotalBaixa',
		ctreceber.situacao AS 'SituacaoTitulo',
		ctreceber.dt_vencimento AS 'DataVencimento',
		ctreceber.dt_prorrogada AS 'DataProrrogada'
		
FROM
fn_titulo_receber AS ctreceber
WHERE YEAR(dt_vencimento) >= @ano-1 AND YEAR(dt_vencimento) <= @ano
GROUP BY DataVencimento;



SELECT dt_vencimento, sum(vl_total_titulo) AS 'total titulo', sum(vl_total_baixa) AS 'total baixa', '1' AS movimentacao
FROM fn_titulo_receber
WHERE cod_empresa = 1 AND dt_vencimento >= '2023-01-01'
GROUP BY 1;