/*
SELECT fn_titulo_receber.dt_vencimento
		,sum(fn_titulo_receber.vl_total_titulo)
		,sum(fn_titulo_receber.vl_total_baixa) 
		,'1' AS movimentacao
		,(SELECT SUM((fn_titulo_pagar.vl_total_titulo)*-1) FROM fn_titulo_pagar WHERE fn_titulo_pagar.cod_empresa = 1 AND fn_titulo_pagar.dt_vencimento >= '2023-01-01') AS pagar
FROM fn_titulo_receber
WHERE fn_titulo_receber.cod_empresa = 1 AND fn_titulo_receber.dt_vencimento >= '2023-01-01'
GROUP BY fn_titulo_receber.dt_vencimento
*/
-- , (SELECT consolidado.SaldoFimDoDia FROM consolidado WHERE consolidado.dt_vencimento = consolidado.dt_vencimento) AS saldoInicial

/*Unica tabela com contas a receber e pagar
1 movimentação entrada - 2 movimentação de saida
*/

SELECT fn_titulo_receber.dt_vencimento AS dataVencimento
		,sum(fn_titulo_receber.vl_total_titulo) AS previsto
		,sum(fn_titulo_receber.vl_total_baixa) AS realizado
		,'1' AS movimentacao
FROM fn_titulo_receber
WHERE fn_titulo_receber.dt_vencimento >= '2023-01-01'
GROUP BY fn_titulo_receber.dt_vencimento
UNION ALL
SELECT fn_titulo_pagar.dt_vencimento AS dataVencimento
		,sum(fn_titulo_pagar.vl_total_titulo) * -1 AS previsto
		,sum(fn_titulo_pagar.vl_total_baixa) * -1 AS realizado
		,'2' AS movimentacao
FROM fn_titulo_pagar
WHERE fn_titulo_pagar.dt_vencimento >= '2023-01-01'
GROUP BY fn_titulo_pagar.dt_vencimento





SELECT consolidado.*
FROM 
(SELECT Receber.dt_vencimento, 
		  Pagar.total_titulo AS PrevPagar, 
		  Pagar.total_baixa AS RealPagar, 
		  Receber.total_titulo AS PrevReceber, 
		  Receber.total_baixa AS RealReceber,		 
		  Receber.total_baixa + Pagar.total_baixa AS SaldoFimDoDia

	FROM 
		(SELECT dt_vencimento, SUM(vl_total_titulo) AS 'total_titulo', SUM(vl_total_baixa) AS 'total_baixa', 1 AS movimentacao
			FROM fn_titulo_receber
			WHERE cod_empresa = 1 
			GROUP BY 1) AS Receber 
	INNER JOIN 
		(SELECT dt_vencimento, SUM((vl_total_titulo)*-1) AS 'total_titulo', SUM((vl_total_baixa)*-1) AS 'total_baixa', 2 AS movimentacao
			FROM fn_titulo_pagar
			WHERE cod_empresa = 1 
			GROUP BY 1) AS Pagar
	ON Receber.dt_vencimento = Pagar.dt_vencimento
			WHERE Receber.dt_vencimento >= '2022-12-30') AS consolidado;

###############################################################################################			
			
SELECT
  consolidado.dt_vencimento
  ,LAG(consolidado.SaldoFimDoDia) OVER (ORDER BY consolidado.dt_vencimento) AS SaldoInicial
  ,consolidado.PrevPagar
  ,consolidado.RealPagar
  ,consolidado.PrevReceber
  ,consolidado.RealReceber
  ,consolidado.SaldoFimDoDia AS SaldoFinal
  
FROM (
  SELECT
    Receber.dt_vencimento,
    Pagar.total_titulo AS PrevPagar,
    Pagar.total_baixa AS RealPagar,
    Receber.total_titulo AS PrevReceber,
    Receber.total_baixa AS RealReceber,
    Receber.total_baixa + Pagar.total_baixa AS SaldoFimDoDia
  FROM (
    SELECT
      dt_vencimento,
      SUM(vl_total_titulo) AS 'total_titulo',
      SUM(vl_total_baixa) AS 'total_baixa',
      1 AS movimentacao
    FROM fn_titulo_receber
    WHERE cod_empresa = 1
    GROUP BY 1
  ) AS Receber
  INNER JOIN (
    SELECT
      dt_vencimento,
      SUM((vl_total_titulo) * -1) AS 'total_titulo',
      SUM((vl_total_baixa) * -1) AS 'total_baixa',
      2 AS movimentacao
    FROM fn_titulo_pagar
    WHERE cod_empresa = 1
    GROUP BY 1
  ) AS Pagar ON Receber.dt_vencimento = Pagar.dt_vencimento
  WHERE Receber.dt_vencimento >= '2022-12-30'
) AS consolidado;

/*
SELECT
  consolidado.dt_vencimento,
  LAG(consolidado.SaldoFimDoDia) OVER (ORDER BY consolidado.dt_vencimento) AS SaldoInicial,
  consolidado.PrevPagar,
  consolidado.RealPagar,
  consolidado.PrevReceber,
  consolidado.RealReceber,
  LAG(consolidado.SaldoFimDoDia) OVER (ORDER BY consolidado.dt_vencimento) + consolidado.RealPagar + consolidado.RealReceber AS SaldoFinal
FROM (
  SELECT
    Receber.dt_vencimento,
    Pagar.total_titulo AS PrevPagar,
    Pagar.total_baixa AS RealPagar,
    Receber.total_titulo AS PrevReceber,
    Receber.total_baixa AS RealReceber,
    Receber.total_baixa + Pagar.total_baixa AS SaldoFimDoDia
  FROM (
    SELECT
      dt_vencimento,
      SUM(vl_total_titulo) AS 'total_titulo',
      SUM(vl_total_baixa) AS 'total_baixa',
      1 AS movimentacao
    FROM fn_titulo_receber
    WHERE cod_empresa = 1
    GROUP BY 1
  ) AS Receber
  INNER JOIN (
    SELECT
      dt_vencimento,
      SUM((vl_total_titulo) * -1) AS 'total_titulo',
      SUM((vl_total_baixa) * -1) AS 'total_baixa',
      2 AS movimentacao
    FROM fn_titulo_pagar
    WHERE cod_empresa = 1
    GROUP BY 1
  ) AS Pagar ON Receber.dt_vencimento = Pagar.dt_vencimento
  WHERE Receber.dt_vencimento >= '2022-12-30'
) AS consolidado;
*/


-- Preciso de uma QUERY em mysql que resolva estaá situação
-- situação: Tenho uma tabela com data, saldoInicial, valorPago, valorRecebido, saldoFinal sendo que o saldoFinal é formado pela operação saldoInicial+valorPAgo+valorRecebido e este valor deve ser o saldo incial dia seguinte.

SELECT
  data,
  saldoInicial,
  valorPago,
  valorRecebido,
  (saldoInicial + valorPago + valorRecebido) AS saldoFinal,
  LAG(saldoInicial + valorPago + valorRecebido) OVER (ORDER BY data) AS saldoInicialDiaSeguinte
FROM sua_tabela
ORDER BY DATA;


SELECT
  consolidado.dt_vencimento
  ,LAG(consolidado.SaldoFimDoDia) OVER (ORDER BY consolidado.dt_vencimento) AS SaldoInicial
  ,consolidado.PrevPagar
  ,consolidado.RealPagar
  ,consolidado.PrevReceber
  ,consolidado.RealReceber
  ,consolidado.SaldoFimDoDia AS SaldoFinal
  
FROM (
  SELECT
    Receber.dt_vencimento,
    Pagar.total_titulo AS PrevPagar,
    Pagar.total_baixa AS RealPagar,
    Receber.total_titulo AS PrevReceber,
    Receber.total_baixa AS RealReceber,
    Receber.total_baixa + Pagar.total_baixa AS SaldoFimDoDia
  FROM (
    SELECT
      dt_vencimento,
      SUM(vl_total_titulo) AS 'total_titulo',
      SUM(vl_total_baixa) AS 'total_baixa',
      1 AS movimentacao
    FROM fn_titulo_receber
    WHERE cod_empresa = 1
    GROUP BY 1
  ) AS Receber
  INNER JOIN (
    SELECT
      dt_vencimento,
      SUM((vl_total_titulo) * -1) AS 'total_titulo',
      SUM((vl_total_baixa) * -1) AS 'total_baixa',
      2 AS movimentacao
    FROM fn_titulo_pagar
    WHERE cod_empresa = 1
    GROUP BY 1
  ) AS Pagar ON Receber.dt_vencimento = Pagar.dt_vencimento
  WHERE Receber.dt_vencimento >= '2022-12-30'
) AS consolidado;



/*Selects para trabalhar com 05 tabelas
fn_titulo_receber -- titulos do contas a receber vl_total_titulo, vl_tatal_baixa, dt_vencimento, situacao
fn_titulo_receber_hist -- vl_total, dt_implant, vl_baixa, tp_hist

fn_titulo_pagar -- titulos do contas a receber vl_total_titulo, vl_tatal_baixa, dt_vencimento, situacao
fn_titulo_pagar_hist -- vl_total, dt_implant, vl_baixa, tp_hist
*/
SELECT cod_empresa, cod_titulo, cod_parcela, cod_pedido, cod_nota_fiscal, serie, cod_cliente, vl_total_titulo, vl_total_baixa, situacao, dt_vencimento 
FROM fn_titulo_receber 
WHERE dt_vencimento BETWEEN '2023-01-01' AND '2023-12-31' AND cod_empresa = 1;

SELECT cod_empresa, cod_titulo, cod_parcela, tp_hist, vl_baixa, vl_juros, vl_multa, vl_total, dt_implant, situacao  
FROM fn_titulo_receber_hist 
WHERE cod_empresa = 1 AND dt_implant BETWEEN '2023-01-01' AND '2023-12-31' AND situacao = 30;

SELECT cod_empresa, cod_titulo, cod_parcela, vl_total_titulo, vl_total_baixa, situacao, dt_vencimento 
FROM fn_titulo_pagar 
WHERE dt_vencimento BETWEEN '2023-01-01' AND '2023-12-31' AND cod_empresa = 1;

SELECT cod_empresa, cod_titulo, cod_parcela, tp_hist, vl_baixa, vl_juros, vl_multa, vl_total, dt_implant, situacao 
FROM fn_titulo_pagar_hist 
WHERE cod_empresa = 1 AND dt_implant BETWEEN '2023-01-01' AND '2023-12-31' AND situacao = 30;

/*----------------------------------------------------------------------------------*/
--- aqui
SELECT fn_titulo_receber.cod_empresa, SUM(fn_titulo_receber_hist.vl_baixa), SUM(fn_titulo_receber_hist.vl_total)
FROM fn_titulo_receber_hist LEFT JOIN fn_titulo_receber
ON fn_titulo_receber_hist.cod_empresa = fn_titulo_receber.cod_empresa
AND fn_titulo_receber_hist.cod_titulo = fn_titulo_receber.cod_titulo
AND fn_titulo_receber_hist.cod_parcela = fn_titulo_receber.cod_parcela

WHERE fn_titulo_receber_hist.dt_referencia >= '2023-06-01' 
		AND fn_titulo_receber_hist.dt_referencia <= '2023-06-01'
		AND fn_titulo_receber_hist.tp_hist = 30
		-- AND (fn_titulo_receber.cod_especie <> 97 OR  fn_titulo_receber.cod_especie is null )
GROUP BY 1;


SELECT SUM(vl_baixa)
FROM fn_titulo_receber_hist
WHERE dt_referencia >= '2023-06-01' AND dt_referencia <= '2023-06-01'



SELECT cod_empresa, SUM(vl_total_baixa), SUM(vl_total_titulo)
FROM fn_titulo_receber
WHERE date(dt_vencimento) = '2023-06-01'
GROUP BY 1;



SELECT cod_empresa, cod_titulo, cod_parcela, cod_pedido, cod_nota_fiscal, serie, cod_cliente, vl_total_titulo, vl_total_baixa, situacao, dt_vencimento 
FROM fn_titulo_receber 
WHERE  cod_titulo = 128906 AND cod_parcela = 18 AND cod_empresa = 1; 


SELECT cod_titulo, cod_parcela, tp_hist, vl_baixa, vl_juros, vl_multa, vl_total, dt_implant, situacao  
FROM fn_titulo_receber_hist 
WHERE cod_titulo = 128906 AND cod_parcela = 18 AND cod_empresa = 1; 

/*-----------------------------------------------------------------------*/
SET @dataInicial = '2023-06-01';
SET @dataFinal = '2023-06-30';

SELECT dt_vencimento AS receber, SUM(vl_total_titulo) AS receberTotal, SUM(vl_total_baixa) AS receberBaixado
FROM fn_titulo_receber 
WHERE date(dt_vencimento) BETWEEN @dataInicial AND @dataFinal
GROUP BY dt_vencimento;
 
-- SELECT year(dt_implant),month(dt_implant),day(dt_implant),
SELECT dt_implant,
SUM(vl_total) AS receberTotal, SUM(vl_baixa) AS receberBaixado
FROM fn_titulo_receber_hist 
WHERE tp_hist = 30 AND situacao = 30 AND date(dt_implant) BETWEEN @dataInicial AND @dataFinal
GROUP BY 1;
 
 
SELECT dt_vencimento AS pagar, SUM(vl_total_titulo) AS pagarrTotal, SUM(vl_total_baixa) AS pagarrBaixado
FROM fn_titulo_pagar 
WHERE date(dt_vencimento) BETWEEN @dataInicial AND @dataFinal
GROUP BY dt_vencimento;

/*********************************************************************************
**********************************************************************************/
/*2023-06-05
Batido com  relatório de fup de cantas a receber filtro por data de pagamento*/
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




