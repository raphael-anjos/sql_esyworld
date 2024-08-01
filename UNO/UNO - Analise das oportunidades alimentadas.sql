--SELECT 
--        cod_status
--        , COUNT(cod_status)
--        , SUM(vl_estimado)
--FROM at_oportunidade
--GROUP BY cod_status;
--
--SELECT descricao, at_oportunidade.* FROM at_oportunidade
--WHERE cod_oportunidade = 12836
--LIMIT 100;

SELECT 
        at_oportunidade.cod_oportunidade
        , IFNULL(vd_pedido.cod_pedido, '') AS cod_pedido
        , CASE at_oportunidade.cod_status WHEN 5 THEN 'SUSPECT' WHEN 10 THEN 'PROSPECT' WHEN 11 THEN 'ANALISE DE CENÁRIO' WHEN 12 THEN 'PROVA DE CONCEITO - POC' WHEN 13 THEN 'HOMOLOGACAO' WHEN 14 THEN 'ENVIO DE PROPOSTA' WHEN 15 THEN 'NEGOCIACAO' WHEN 16 THEN 'COMPRAS' WHEN 17 THEN 'IMPORTACAO DE RENOVAÇÃO' WHEN 20 THEN 'ANÁLISE DE PRÉ-VENDA' WHEN 21 THEN 'ANÁLISE DE SERVIÇOS' WHEN 50 THEN 'PROPOSTA ENVIADA' WHEN 102 THEN 'CANCELADA' WHEN 103 THEN 'PEDIDO' WHEN 104 THEN 'PERDIDO' WHEN 105 THEN 'FATURADO' WHEN 106 THEN 'DUPLICADA' ELSE 'NÃO CLASSIFICADO' END AS status_oportunidade
        , UPPER(sg_colaborador.nome_colaborador) AS nome_colaborador
        , CASE WHEN sg_colaborador.cod_colaborador IN (3797, 43, 4811, 3797, 2565, 4582) THEN 'TOP RENEW' ELSE 'OUTROS' END AS equipe_colaborador
        , UPPER(cad_revenda.nome_colaborador) AS nome_revenda
        , UPPER(cd_cliente.nome_cliente) AS nome_cliente
        , UPPER(IFNULL(cd_cliente_contato.nome_contato,'')) AS nome_contato
        , UPPER(cd_familia_comercial.desc_abrev) AS nome_familia_comercial
        , (SELECT COUNT(at_oportunidade_item.cod_oportunidade) FROM at_oportunidade_item WHERE at_oportunidade_item.cod_oportunidade = at_oportunidade.cod_oportunidade) AS qtd_itens_oportunidade
        , UPPER(IFNULL(at_oportunidade_item.cod_produto,'')) AS cod_produto
        , IFNULL(cd_produto.desc_comercial, '') AS desc_produto
        , CASE SUBSTRING(UPPER(at_oportunidade_item.cod_produto),9,1) WHEN 'A' THEN '1' WHEN 'B' THEN '2' WHEN 'C' THEN '3' WHEN 'D' THEN '4' WHEN 'E' THEN '5-9' WHEN 'K' THEN '10-14' WHEN 'M' THEN '15-19' WHEN 'N' THEN '20-24' WHEN 'P' THEN '25-49' WHEN 'Q' THEN '50-99' WHEN 'R' THEN '100-149' WHEN 'S' THEN '150-249' WHEN 'T' THEN '250-499' WHEN 'U' THEN '500-999' WHEN 'V' THEN '1000-1499' WHEN 'W' THEN '1500-2499' WHEN 'X' THEN '2500-4999' WHEN 'Y' THEN '5000+' ELSE 'NÃO CLASSIFICADA' END AS banda_produto
        , CASE WHEN SUBSTRING(UPPER(at_oportunidade_item.cod_produto),9,1) IN('A', 'B', 'C', 'D', 'E', 'K', 'M', 'N', 'P', 'Q', 'R', 'S') THEN '1-249' WHEN SUBSTRING(UPPER(at_oportunidade_item.cod_produto),9,1) IN ('T', 'U', 'V', 'W') THEN '250-2499' WHEN SUBSTRING(UPPER(at_oportunidade_item.cod_produto),9,1) IN('X', 'Y') THEN '2500+' ELSE 'NÃO CLASSIFICADA' END AS grp_banda_produto
        , CASE SUBSTRING(UPPER(at_oportunidade_item.cod_produto),10,1) WHEN 'F' THEN '1 ANO' WHEN 'D' THEN '2 ANOS' WHEN 'T' THEN '3 ANOS' ELSE 'NÃO CLASSIFICADA' END AS validade_licenca 
        , CASE WHEN SUBSTRING(UPPER(at_oportunidade_item.cod_produto),11,1) IN('S', 'R') THEN 'PRIVADO' WHEN SUBSTRING(UPPER(at_oportunidade_item.cod_produto),11,1) IN ('E', 'Q') THEN 'EDUCACIONAL' WHEN SUBSTRING(UPPER(at_oportunidade_item.cod_produto),11,1) IN ('C', 'J') THEN 'GOVERNAMENTAL' WHEN SUBSTRING(UPPER(at_oportunidade_item.cod_produto),11,1) = 'W' THEN 'CROSS-GRADE' ELSE 'MISTO' END AS tipo_licenca 
        , at_oportunidade.tb_preco AS tabela_preco
        , at_oportunidade.vl_estimado AS vl_oportunidade
        , IFNULL(vd_pedido.vl_total_pedido, 0) as vl_total_pedido
FROM at_oportunidade
JOIN sg_colaborador ON sg_colaborador.cod_colaborador = at_oportunidade.cod_colaborador
LEFT JOIN cd_cliente ON cd_cliente.cod_cliente = at_oportunidade.cod_cliente
LEFT JOIN sg_colaborador cad_revenda ON cad_revenda.cod_colaborador = at_oportunidade.cod_revenda
LEFT JOIN cd_cliente_contato ON cd_cliente_contato.cod_contato = at_oportunidade.cod_contato AND cd_cliente_contato.cod_cliente = at_oportunidade.cod_cliente
LEFT JOIN cd_familia_comercial ON cd_familia_comercial.cod_familia_comercial = at_oportunidade.cod_familia_comercial
LEFT JOIN vd_pedido ON vd_pedido.cod_oportunidade = at_oportunidade.cod_oportunidade
JOIN at_historico ON at_historico.cod_oportunidade = at_oportunidade.cod_oportunidade
LEFT JOIN at_oportunidade_item ON at_oportunidade_item.cod_oportunidade = at_oportunidade.cod_oportunidade
LEFT JOIN cd_produto on cd_produto.cod_produto = at_oportunidade_item.cod_produto
WHERE at_historico.dt_referencia = '2016-12-23 03:10:27'
        AND at_oportunidade.dt_abertura = '2017-01-01 00:00:00'
--HAVING (SELECT COUNT(at_oportunidade_item.cod_oportunidade) FROM at_oportunidade_item WHERE at_oportunidade_item.cod_oportunidade = at_oportunidade.cod_oportunidade) > 0 ;

--SELECT nome_colaborador, REPLACE(nome_colaborador, '	', '')
--FROM sg_colaborador
--WHERE cod_colaborador = 3738
--
--SELECT nome_colaborador, REPLACE(nome_colaborador, '	', '')
--FROM sg_colaborador
--WHERE nome_colaborador LIKE '%	%'
--
--START TRANSACTION;
--UPDATE sg_colaborador SET nome_colaborador = REPLACE(nome_colaborador, '	', '')
--WHERE nome_colaborador LIKE '%	%';
--COMMIT;
--ROLLBACK;

--SELECT nome_cliente, REPLACE(nome_cliente, '	', '')
--FROM cd_cliente
--WHERE cod_cliente = 113309
--
--SELECT nome_cliente, REPLACE(nome_cliente, '	', '')
--FROM cd_cliente
--WHERE nome_cliente LIKE '%	%'
--
--START TRANSACTION;
--UPDATE cd_cliente SET nome_cliente = REPLACE(nome_cliente, '	', '')
--WHERE nome_cliente LIKE '%	%';
--
--SELECT nome_cliente, REPLACE(nome_cliente, '	', '')
--FROM cd_cliente
--WHERE nome_cliente LIKE '%	%';
--
--COMMIT;
--ROLLBACK;

SELECT nome_contato, REPLACE(nome_contato, '	', '')
FROM cd_cliente_contato
WHERE cod_cliente = 113309

SELECT nome_contato, REPLACE(nome_contato, '	', '')
FROM cd_cliente_contato
WHERE nome_contato LIKE '%	%'

START TRANSACTION;
UPDATE cd_cliente_contato SET nome_contato = REPLACE(nome_contato, '	', '')
WHERE nome_contato LIKE '%	%';

SELECT nome_contato, REPLACE(nome_contato, '	', '')
FROM cd_cliente_contato
WHERE nome_contato LIKE '%	%';

COMMIT;
ROLLBACK;

RJ VENDAS E AUTOMAÇÃO LTDA ME		
RJ VENDAS E AUTOMAÇÃO LTDA ME		
RJ VENDAS E AUTOMAÇÃO LTDA ME
--
--
--SELECT * FROM at_oportunidade
--JOIN at_historico ON at_historico.cod_oportunidade = at_oportunidade.cod_oportunidade
--WHERE at_historico.dt_referencia = '2016-12-23 03:10:27'
--        AND at_oportunidade.dt_abertura = '2017-01-01 00:00:00';
--
--
--SELECT * FROM cd_familia_comercial
--LIMIT 100;

-- TP APLICACAO
--        1 - EDUCACIONAL;
--        2 - PRIVADO;
--        3 - GOVERNO;
--        4 - MISTO;

--SITUACAO 
--        5 - SUSPECT; 
--        10 - PROSPECT; 
--        11 - ANALISE DE CENÁRIO; 
--        12 - PROVA DE CONCEITO - POC; 
--        13 - HOMOLOGACAO; 
--        14 - ENVIO DE PROPOSTA; 
--        15 - NEGOCIACAO; 
--        16 - COMPRAS; 
--        17 - IMPORTACAO DE RENOVAÇÃO; 
--        20 - ANÁLISE DE PRÉ-VENDA; 
--        21 - ANÁLISE DE SERVIÇOS; 
--        50 - PROPOSTA ENVIADA; 
--        102 - CANCELADA; 
--        103 - PEDIDO; 
--        104 - PERDIDO; 
--        105 - FATURADO; 
--        106 - DUPLICADA; 
