SELECT DISTINCT 
	CONCAT(contas_receber.titulo, "/", contas_receber.parcela_titulo) AS 'Nr. Titulo',
	contas_receber.pedido AS 'Cód. Pedido',
	contas_receber.fornecedor AS 'Fornecedor',
	contas_receber.data_emissao AS 'Data Emissão',
	contas_receber.data_vencimento AS 'Data Vencimento',
	contas_receber.periodo AS 'Período',
	contas_receber.cliente AS 'Nome Cliente',
	contas_receber.estado AS 'Estado',
	contas_receber.situacao AS 'Situação',
	contas_receber.forma_pagamento AS 'Forma de Pagamento',
	contas_receber.banco AS 'Cód. Banco',
	contas_receber.conta AS 'Conta',
	contas_receber.responsavel_cobranca AS 'Responsável Cobrança',
	contas_receber.colaborador AS 'Vendedor',
	contas_receber.obs AS 'Observação',
	ROUND(contas_receber.total_titulo - total_baixa,2) AS 'Valor total título'
	
	
FROM 
(SELECT 
	receber.cod_titulo AS titulo, 
	receber.cod_parcela AS parcela_titulo,
	receber.cod_pedido AS pedido,
	fornecedor.razao_social AS fornecedor, 
	DATE_FORMAT(receber.dt_emissao, '%d-%m-%Y') AS data_emissao,
	DATE_FORMAT(receber.dt_vencimento, '%d-%m-%Y') AS data_vencimento,
	DATEDIFF(CURDATE(),receber.dt_vencimento) AS dias_atraso,
	CASE
		WHEN DATEDIFF(CURDATE(),receber.dt_vencimento) BETWEEN 0 AND 5 THEN 'Até 5 dias'
		WHEN DATEDIFF(CURDATE(),receber.dt_vencimento) BETWEEN 6 AND 15 THEN 'Até 15 dias'
		WHEN DATEDIFF(CURDATE(),receber.dt_vencimento) BETWEEN 16 AND 30 THEN 'Até 30 dias'
		WHEN DATEDIFF(CURDATE(),receber.dt_vencimento) BETWEEN 31 AND 60 THEN 'Acima de 30 dias'
		WHEN DATEDIFF(CURDATE(),receber.dt_vencimento) BETWEEN 61 AND 90 THEN 'Acima de 60 dias'
		WHEN DATEDIFF(CURDATE(), receber.dt_vencimento) > 90 THEN 'Acima de 90 dias'
		ELSE 'Dentro do vencimento'
	END AS periodo,
	receber.cod_cliente,
	cli.nome_cliente AS cliente,
	receber.sigla_uf AS estado,
	CASE
		WHEN receber.situacao = 5 THEN 'Previsão'
		WHEN receber.situacao = 10 THEN 'Efetiva'
		WHEN receber.situacao = 11 THEN 'Em Negociação Comercial'
		WHEN receber.situacao = 12 THEN 'Em Negociação Financeiro'
		WHEN receber.situacao = 16 THEN 'Tercerizada'
		WHEN receber.situacao = 30 THEN 'Pago'
		WHEN receber.situacao = 111 THEN 'Cartório'
		WHEN receber.situacao = 15 THEN 'Protestado'
		WHEN receber.situacao = 20 THEN 'Pagamento Parcial'
		WHEN receber.situacao = 95 THEN 'Sem Previsão'
		WHEN receber.situacao = 100 THEN 'Perdido'
		WHEN receber.situacao = 106 THEN 'Perdido em Execução'
		WHEN receber.situacao = 107 THEN 'Perdido Protestado'
		WHEN receber.situacao = 108 THEN 'Perdido Negativado'
		WHEN receber.situacao = 109 THEN 'Protestado em Execução'
		WHEN receber.situacao = 110 THEN 'Negativado em Execução'
		WHEN receber.situacao = 105 THEN 'Acordo'
		WHEN receber.situacao = 90 THEN 'Cancelado'
	END AS situacao,
	receber.cod_forma_pagto,
	pagto.desc_abrev AS forma_pagamento,
	receber.cod_banco AS banco,
	receber.sub_conta AS conta,
	CASE
		WHEN cli.nome_cliente = 'KALUNGA SA' THEN 'Moabe'
		WHEN cli.nome_cliente = 'KSCORP TRADE AND SERVICES LTDA' THEN 'Moabe'
		WHEN cli.nome_cliente = 'KS SOLUCOES CORPORATIVAS LTDA' THEN 'Moabe'
		ELSE 'Wallace'
	END AS responsavel_cobranca,
	colab.nome_colaborador AS colaborador,
	receber.obs_titulo AS Obs,
	receber.vl_total_titulo AS total_titulo,
	receber.perc_juros AS juros,
	receber.vl_total_baixa AS total_baixa
	
	
	 
FROM fn_titulo_receber AS receber
LEFT JOIN vd_nota_fiscal AS nf ON nf.cod_nota_fiscal = receber.cod_nota_fiscal
LEFT JOIN vd_pedido_item AS item ON item.cod_pedido = nf.cod_pedido
LEFT JOIN cd_produto AS cadItem ON cadItem.cod_produto = item.cod_produto
LEFT JOIN cd_fornecedor AS fornecedor ON fornecedor.cod_fornecedor = cadItem.cod_fornecedor
LEFT JOIN cd_cliente AS cli ON cli.cod_cliente = receber.cod_cliente
LEFT JOIN cd_forma_pagto AS pagto ON pagto.cod_forma_pagto = receber.cod_forma_pagto
LEFT JOIN sv_plano_servico AS plano ON plano.cod_cliente = receber.cod_cliente
LEFT JOIN sg_colaborador AS colab ON colab.cod_colaborador = nf.cod_colaborador
WHERE dt_vencimento BETWEEN '2020-01-01' AND DATE_SUB(CURDATE(), INTERVAL 1 DAY)
		AND receber.situacao <> 90 
 		AND receber.situacao <> 105 
		AND receber.situacao <> 30
	   AND nf.cod_colaborador = 5794
		AND cli.cod_cliente <> 6 AND cli.cod_cliente <> 103522) AS contas_receber


	
LEFT JOIN 
(
	SELECT
		baixa_receber.cod_titulo, 
		baixa_receber.cod_parcela,
		baixa_receber.dt_conciliacao AS data_conciliacao,
		baixa_receber.cod_forma_pagto,
		baixa_receber.vl_baixa AS valor_baixa
	FROM fn_titulo_receber_hist AS baixa_receber
	WHERE baixa_receber.cod_forma_pagto = 3 AND baixa_receber.dt_conciliacao IS NULL 
) AS contas_receber_baixa

ON contas_receber_baixa.cod_titulo = contas_receber.titulo