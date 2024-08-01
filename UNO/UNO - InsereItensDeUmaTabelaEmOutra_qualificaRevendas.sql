/*TABELA PROMOÇÃO CYLANCE*/
START TRANSACTION;
SET @TabelaDe = 'CYLANCE_ESME';
SET @TabelaPara = 'PRM_CYLANCE' ;

INSERT IGNORE INTO cd_preco_item (qtd_min,tb_preco,cod_produto,preco_unit,situacao,dt_alteracao, ind_ajuste_preco,qtd_ponto,ind_variacao_diferenciada,perc_variacao_max, perc_variacao_min,preco_minimo,preco_maximo,precificacao)
SELECT 	qtd_min,@TabelaPara,cod_produto,preco_unit,situacao,NOW() AS DATA,ind_ajuste_preco,qtd_ponto,ind_variacao_diferenciada,perc_variacao_max, perc_variacao_min,preco_minimo,preco_maximo,precificacao
FROM cd_preco_item 
WHERE tb_preco = @TabelaDe 
AND cod_produto IN ('PTLASTDSD1099-1Y','PTLASTDSD100249-1Y','PTLASTDSD250499-1Y','PTLASTDSD500999-1Y',
'PTLASTDSD10004999-1Y','PTLASTDSD5000-1Y','PTLASTDSD1099-3Y','PTLASTDSD100249-3Y',
'PTLASTDSD250499-3Y','PTLASTDSD500999-3Y','PTLASTDSD10004999-3Y','PTLASTDSD5000-3Y',
'POLASTDSD1099-1Y','POLASTDSD100249-1Y','POLASTDSD250499-1Y','POLASTDSD500999-1Y',
'POLASTDSD10004999-1Y','POLASTDSD5000-1Y','POLASTDSD1099-3Y','POLASTDSD100249-3Y',
'POLASTDSD250499-3Y','POLASTDSD500999-3Y','POLASTDSD10004999-3Y','POLASTDSD5000-3Y');

UPDATE cd_preco_item SET preco_unit = 14.45 WHERE cod_produto = 'PTLASTDSD1099-1Y' AND tb_preco = 'PRM_CYLANCE';
UPDATE cd_preco_item SET preco_unit = 12.99 WHERE cod_produto = 'PTLASTDSD100249-1Y' AND tb_preco = 'PRM_CYLANCE';
UPDATE cd_preco_item SET preco_unit = 11.69 WHERE cod_produto = 'PTLASTDSD250499-1Y' AND tb_preco = 'PRM_CYLANCE';
UPDATE cd_preco_item SET preco_unit = 10.53 WHERE cod_produto = 'PTLASTDSD500999-1Y' AND tb_preco = 'PRM_CYLANCE';
UPDATE cd_preco_item SET preco_unit = 9.48 WHERE cod_produto = 'PTLASTDSD10004999-1Y' AND tb_preco = 'PRM_CYLANCE';
UPDATE cd_preco_item SET preco_unit = 8.53 WHERE cod_produto = 'PTLASTDSD5000-1Y' AND tb_preco = 'PRM_CYLANCE';
UPDATE cd_preco_item SET preco_unit = 43.34 WHERE cod_produto = 'PTLASTDSD1099-3Y' AND tb_preco = 'PRM_CYLANCE';
UPDATE cd_preco_item SET preco_unit = 38.98 WHERE cod_produto = 'PTLASTDSD100249-3Y' AND tb_preco = 'PRM_CYLANCE';
UPDATE cd_preco_item SET preco_unit = 35.08 WHERE cod_produto = 'PTLASTDSD250499-3Y' AND tb_preco = 'PRM_CYLANCE';
UPDATE cd_preco_item SET preco_unit = 31.59 WHERE cod_produto = 'PTLASTDSD500999-3Y' AND tb_preco = 'PRM_CYLANCE';
UPDATE cd_preco_item SET preco_unit = 28.43 WHERE cod_produto = 'PTLASTDSD10004999-3Y' AND tb_preco = 'PRM_CYLANCE';
UPDATE cd_preco_item SET preco_unit = 25.59 WHERE cod_produto = 'PTLASTDSD5000-3Y' AND tb_preco = 'PRM_CYLANCE';
UPDATE cd_preco_item SET preco_unit = 18.79 WHERE cod_produto = 'POLASTDSD1099-1Y' AND tb_preco = 'PRM_CYLANCE';
UPDATE cd_preco_item SET preco_unit = 16.91 WHERE cod_produto = 'POLASTDSD100249-1Y' AND tb_preco = 'PRM_CYLANCE';
UPDATE cd_preco_item SET preco_unit = 15.22 WHERE cod_produto = 'POLASTDSD250499-1Y' AND tb_preco = 'PRM_CYLANCE';
UPDATE cd_preco_item SET preco_unit = 13.7 WHERE cod_produto = 'POLASTDSD500999-1Y' AND tb_preco = 'PRM_CYLANCE';
UPDATE cd_preco_item SET preco_unit = 12.33 WHERE cod_produto = 'POLASTDSD10004999-1Y' AND tb_preco = 'PRM_CYLANCE';
UPDATE cd_preco_item SET preco_unit = 11.1 WHERE cod_produto = 'POLASTDSD5000-1Y' AND tb_preco = 'PRM_CYLANCE';
UPDATE cd_preco_item SET preco_unit = 56.37 WHERE cod_produto = 'POLASTDSD1099-3Y' AND tb_preco = 'PRM_CYLANCE';
UPDATE cd_preco_item SET preco_unit = 50.73 WHERE cod_produto = 'POLASTDSD100249-3Y' AND tb_preco = 'PRM_CYLANCE';
UPDATE cd_preco_item SET preco_unit = 45.66 WHERE cod_produto = 'POLASTDSD250499-3Y' AND tb_preco = 'PRM_CYLANCE';
UPDATE cd_preco_item SET preco_unit = 41.09 WHERE cod_produto = 'POLASTDSD500999-3Y' AND tb_preco = 'PRM_CYLANCE';
UPDATE cd_preco_item SET preco_unit = 36.98 WHERE cod_produto = 'POLASTDSD10004999-3Y' AND tb_preco = 'PRM_CYLANCE';
UPDATE cd_preco_item SET preco_unit = 33.29 WHERE cod_produto = 'POLASTDSD5000-3Y' AND tb_preco = 'PRM_CYLANCE';

COMMIT;



/*TABELA PROMOÇÃO SAFETICA*/
START TRANSACTION;
SET @TabelaDe = 'SAFETICA';
SET @TabelaPara = 'PRM_SAFETICA';

INSERT IGNORE INTO cd_preco_item (qtd_min,tb_preco,cod_produto,preco_unit,situacao,dt_alteracao, ind_ajuste_preco,qtd_ponto,ind_variacao_diferenciada,perc_variacao_max, perc_variacao_min,preco_minimo,preco_maximo,precificacao)
SELECT 	qtd_min,@TabelaPara,cod_produto,preco_unit,situacao,NOW() AS DATA,ind_ajuste_preco,qtd_ponto,ind_variacao_diferenciada,perc_variacao_max, perc_variacao_min,preco_minimo,preco_maximo,precificacao
FROM cd_preco_item 
WHERE tb_preco = @TabelaDe 
AND cod_produto IN ('SAF-DISCOVERY-A-1Y','SAF-DISCOVERY-B-1Y','SAF-DISCOVERY-C-1Y','SAF-DISCOVERY-D-1Y',
'SAF-DISCOVERY-A-2Y','SAF-DISCOVERY-B-2Y','SAF-DISCOVERY-C-2Y','SAF-DISCOVERY-D-2Y','SAF-DISCOVERY-E-2Y',
'SAF-DISCOVERY-A-3Y','SAF-DISCOVERY-B-3Y','SAF-DISCOVERY-C-3Y','SAF-DISCOVERY-D-3Y','SAF-DISCOVERY-E-3Y',
'SAF-PROTECTION-A-1Y','SAF-PROTECTION-B-1Y','SAF-PROTECTION-C-1Y','SAF-PROTECTION-D-1Y','SAF-PROTECTION-E-1Y',
'SAF-PROTECTION-A-2Y','SAF-PROTECTION-B-2Y','SAF-PROTECTION-C-2Y','SAF-PROTECTION-D-2Y','SAF-PROTECTION-E-2Y',
'SAF-PROTECTION-A-3Y','SAF-PROTECTION-B-3Y','SAF-PROTECTION-C-3Y','SAF-PROTECTION-D-3Y','SAF-PROTECTION-E-3Y',
'SAF-ENTERPRISE-A-1Y','SAF-ENTERPRISE-B-1Y','SAF-ENTERPRISE-C-1Y','SAF-ENTERPRISE-D-1Y','SAF-ENTERPRISE-E-1Y',
'SAF-ENTERPRISE-A-2Y','SAF-ENTERPRISE-B-2Y','SAF-ENTERPRISE-C-2Y','SAF-ENTERPRISE-D-2Y','SAF-ENTERPRISE-E-2Y',
'SAF-ENTERPRISE-A-3Y','SAF-ENTERPRISE-B-3Y','SAF-ENTERPRISE-C-3Y','SAF-ENTERPRISE-D-3Y','SAF-ENTERPRISE-E-3Y',
'SAF-MOBILE-A-1Y','SAF-MOBILE-B-1Y','SAF-MOBILE-C-1Y','SAF-MOBILE-D-1Y','SAF-MOBILE-E-1Y','SAF-MOBILE-A-2Y',
'SAF-MOBILE-B-2Y','SAF-MOBILE-C-2Y','SAF-MOBILE-D-2Y','SAF-MOBILE-E-2Y','SAF-MOBILE-A-3Y','SAF-MOBILE-B-3Y',
'SAF-MOBILE-C-3Y','SAF-MOBILE-D-3Y','SAF-DISCOVERY-E-1Y','SAF-MOBILE-E-3Y');

UPDATE cd_preco_item SET preco_unit = 124.56 WHERE cod_produto = 'SAF-DISCOVERY-A-1Y' AND tb_preco = 'PRM_SAFETICA';
UPDATE cd_preco_item SET preco_unit = 100.08 WHERE cod_produto = 'SAF-DISCOVERY-B-1Y' AND tb_preco = 'PRM_SAFETICA';
UPDATE cd_preco_item SET preco_unit = 90 WHERE cod_produto = 'SAF-DISCOVERY-C-1Y' AND tb_preco = 'PRM_SAFETICA';
UPDATE cd_preco_item SET preco_unit = 79.92 WHERE cod_produto = 'SAF-DISCOVERY-D-1Y' AND tb_preco = 'PRM_SAFETICA';
UPDATE cd_preco_item SET preco_unit = 69.84 WHERE cod_produto = 'SAF-DISCOVERY-E-1Y' AND tb_preco = 'PRM_SAFETICA';
UPDATE cd_preco_item SET preco_unit = 199.44 WHERE cod_produto = 'SAF-DISCOVERY-A-2Y' AND tb_preco = 'PRM_SAFETICA';
UPDATE cd_preco_item SET preco_unit = 159.84 WHERE cod_produto = 'SAF-DISCOVERY-B-2Y' AND tb_preco = 'PRM_SAFETICA';
UPDATE cd_preco_item SET preco_unit = 144 WHERE cod_produto = 'SAF-DISCOVERY-C-2Y' AND tb_preco = 'PRM_SAFETICA';
UPDATE cd_preco_item SET preco_unit = 127.44 WHERE cod_produto = 'SAF-DISCOVERY-D-2Y' AND tb_preco = 'PRM_SAFETICA';
UPDATE cd_preco_item SET preco_unit = 111.6 WHERE cod_produto = 'SAF-DISCOVERY-E-2Y' AND tb_preco = 'PRM_SAFETICA';
UPDATE cd_preco_item SET preco_unit = 262.08 WHERE cod_produto = 'SAF-DISCOVERY-A-3Y' AND tb_preco = 'PRM_SAFETICA';
UPDATE cd_preco_item SET preco_unit = 209.52 WHERE cod_produto = 'SAF-DISCOVERY-B-3Y' AND tb_preco = 'PRM_SAFETICA';
UPDATE cd_preco_item SET preco_unit = 188.64 WHERE cod_produto = 'SAF-DISCOVERY-C-3Y' AND tb_preco = 'PRM_SAFETICA';
UPDATE cd_preco_item SET preco_unit = 167.76 WHERE cod_produto = 'SAF-DISCOVERY-D-3Y' AND tb_preco = 'PRM_SAFETICA';
UPDATE cd_preco_item SET preco_unit = 146.88 WHERE cod_produto = 'SAF-DISCOVERY-E-3Y' AND tb_preco = 'PRM_SAFETICA';
UPDATE cd_preco_item SET preco_unit = 198.72 WHERE cod_produto = 'SAF-PROTECTION-A-1Y' AND tb_preco = 'PRM_SAFETICA';
UPDATE cd_preco_item SET preco_unit = 159.12 WHERE cod_produto = 'SAF-PROTECTION-B-1Y' AND tb_preco = 'PRM_SAFETICA';
UPDATE cd_preco_item SET preco_unit = 142.56 WHERE cod_produto = 'SAF-PROTECTION-C-1Y' AND tb_preco = 'PRM_SAFETICA';
UPDATE cd_preco_item SET preco_unit = 126.72 WHERE cod_produto = 'SAF-PROTECTION-D-1Y' AND tb_preco = 'PRM_SAFETICA';
UPDATE cd_preco_item SET preco_unit = 110.88 WHERE cod_produto = 'SAF-PROTECTION-E-1Y' AND tb_preco = 'PRM_SAFETICA';
UPDATE cd_preco_item SET preco_unit = 317.52 WHERE cod_produto = 'SAF-PROTECTION-A-2Y' AND tb_preco = 'PRM_SAFETICA';
UPDATE cd_preco_item SET preco_unit = 254.16 WHERE cod_produto = 'SAF-PROTECTION-B-2Y' AND tb_preco = 'PRM_SAFETICA';
UPDATE cd_preco_item SET preco_unit = 228.96 WHERE cod_produto = 'SAF-PROTECTION-C-2Y' AND tb_preco = 'PRM_SAFETICA';
UPDATE cd_preco_item SET preco_unit = 203.04 WHERE cod_produto = 'SAF-PROTECTION-D-2Y' AND tb_preco = 'PRM_SAFETICA';
UPDATE cd_preco_item SET preco_unit = 177.84 WHERE cod_produto = 'SAF-PROTECTION-E-2Y' AND tb_preco = 'PRM_SAFETICA';
UPDATE cd_preco_item SET preco_unit = 416.88 WHERE cod_produto = 'SAF-PROTECTION-A-3Y' AND tb_preco = 'PRM_SAFETICA';
UPDATE cd_preco_item SET preco_unit = 333.36 WHERE cod_produto = 'SAF-PROTECTION-B-3Y' AND tb_preco = 'PRM_SAFETICA';
UPDATE cd_preco_item SET preco_unit = 300.24 WHERE cod_produto = 'SAF-PROTECTION-C-3Y' AND tb_preco = 'PRM_SAFETICA';
UPDATE cd_preco_item SET preco_unit = 266.4 WHERE cod_produto = 'SAF-PROTECTION-D-3Y' AND tb_preco = 'PRM_SAFETICA';
UPDATE cd_preco_item SET preco_unit = 233.28 WHERE cod_produto = 'SAF-PROTECTION-E-3Y' AND tb_preco = 'PRM_SAFETICA';
UPDATE cd_preco_item SET preco_unit = 254.88 WHERE cod_produto = 'SAF-ENTERPRISE-A-1Y' AND tb_preco = 'PRM_SAFETICA';
UPDATE cd_preco_item SET preco_unit = 204.48 WHERE cod_produto = 'SAF-ENTERPRISE-B-1Y' AND tb_preco = 'PRM_SAFETICA';
UPDATE cd_preco_item SET preco_unit = 183.6 WHERE cod_produto = 'SAF-ENTERPRISE-C-1Y' AND tb_preco = 'PRM_SAFETICA';
UPDATE cd_preco_item SET preco_unit = 163.44 WHERE cod_produto = 'SAF-ENTERPRISE-D-1Y' AND tb_preco = 'PRM_SAFETICA';
UPDATE cd_preco_item SET preco_unit = 142.56 WHERE cod_produto = 'SAF-ENTERPRISE-E-1Y' AND tb_preco = 'PRM_SAFETICA';
UPDATE cd_preco_item SET preco_unit = 408.24 WHERE cod_produto = 'SAF-ENTERPRISE-A-2Y' AND tb_preco = 'PRM_SAFETICA';
UPDATE cd_preco_item SET preco_unit = 326.88 WHERE cod_produto = 'SAF-ENTERPRISE-B-2Y' AND tb_preco = 'PRM_SAFETICA';
UPDATE cd_preco_item SET preco_unit = 293.76 WHERE cod_produto = 'SAF-ENTERPRISE-C-2Y' AND tb_preco = 'PRM_SAFETICA';
UPDATE cd_preco_item SET preco_unit = 261.36 WHERE cod_produto = 'SAF-ENTERPRISE-D-2Y' AND tb_preco = 'PRM_SAFETICA';
UPDATE cd_preco_item SET preco_unit = 228.96 WHERE cod_produto = 'SAF-ENTERPRISE-E-2Y' AND tb_preco = 'PRM_SAFETICA';
UPDATE cd_preco_item SET preco_unit = 535.68 WHERE cod_produto = 'SAF-ENTERPRISE-A-3Y' AND tb_preco = 'PRM_SAFETICA';
UPDATE cd_preco_item SET preco_unit = 428.4 WHERE cod_produto = 'SAF-ENTERPRISE-B-3Y' AND tb_preco = 'PRM_SAFETICA';
UPDATE cd_preco_item SET preco_unit = 385.92 WHERE cod_produto = 'SAF-ENTERPRISE-C-3Y' AND tb_preco = 'PRM_SAFETICA';
UPDATE cd_preco_item SET preco_unit = 342.72 WHERE cod_produto = 'SAF-ENTERPRISE-D-3Y' AND tb_preco = 'PRM_SAFETICA';
UPDATE cd_preco_item SET preco_unit = 300.24 WHERE cod_produto = 'SAF-ENTERPRISE-E-3Y' AND tb_preco = 'PRM_SAFETICA';
UPDATE cd_preco_item SET preco_unit = 43.92 WHERE cod_produto = 'SAF-MOBILE-A-1Y' AND tb_preco = 'PRM_SAFETICA';
UPDATE cd_preco_item SET preco_unit = 35.28 WHERE cod_produto = 'SAF-MOBILE-B-1Y' AND tb_preco = 'PRM_SAFETICA';
UPDATE cd_preco_item SET preco_unit = 31.68 WHERE cod_produto = 'SAF-MOBILE-C-1Y' AND tb_preco = 'PRM_SAFETICA';
UPDATE cd_preco_item SET preco_unit = 28.08 WHERE cod_produto = 'SAF-MOBILE-D-1Y' AND tb_preco = 'PRM_SAFETICA';
UPDATE cd_preco_item SET preco_unit = 24.48 WHERE cod_produto = 'SAF-MOBILE-E-1Y' AND tb_preco = 'PRM_SAFETICA';
UPDATE cd_preco_item SET preco_unit = 70.56 WHERE cod_produto = 'SAF-MOBILE-A-2Y' AND tb_preco = 'PRM_SAFETICA';
UPDATE cd_preco_item SET preco_unit = 56.88 WHERE cod_produto = 'SAF-MOBILE-B-2Y' AND tb_preco = 'PRM_SAFETICA';
UPDATE cd_preco_item SET preco_unit = 51.12 WHERE cod_produto = 'SAF-MOBILE-C-2Y' AND tb_preco = 'PRM_SAFETICA';
UPDATE cd_preco_item SET preco_unit = 45.36 WHERE cod_produto = 'SAF-MOBILE-D-2Y' AND tb_preco = 'PRM_SAFETICA';
UPDATE cd_preco_item SET preco_unit = 39.6 WHERE cod_produto = 'SAF-MOBILE-E-2Y' AND tb_preco = 'PRM_SAFETICA';
UPDATE cd_preco_item SET preco_unit = 92.88 WHERE cod_produto = 'SAF-MOBILE-A-3Y' AND tb_preco = 'PRM_SAFETICA';
UPDATE cd_preco_item SET preco_unit = 74.16 WHERE cod_produto = 'SAF-MOBILE-B-3Y' AND tb_preco = 'PRM_SAFETICA';
UPDATE cd_preco_item SET preco_unit = 66.96 WHERE cod_produto = 'SAF-MOBILE-C-3Y' AND tb_preco = 'PRM_SAFETICA';
UPDATE cd_preco_item SET preco_unit = 59.76 WHERE cod_produto = 'SAF-MOBILE-D-3Y' AND tb_preco = 'PRM_SAFETICA';
UPDATE cd_preco_item SET preco_unit = 51.84 WHERE cod_produto = 'SAF-MOBILE-E-3Y' AND tb_preco = 'PRM_SAFETICA';

COMMIT;

/*iNSERINDO AS QUALIFICAÇÕES PARA TODAS AS REVENDAS CADASTRADAS*/
START TRANSACTION;
SET @cod_qualificacao = 174;
INSERT INTO
cd_cliente_atividade (cod_cliente, cod_ramo_atividade)
SELECT cod_cliente, @cod_qualificacao FROM cd_cliente
WHERE cod_revenda_gerado > 0;
COMMIT;


START TRANSACTION;
SET @cod_qualificacao = 175;
INSERT INTO cd_cliente_atividade (cod_cliente, cod_ramo_atividade)
SELECT cod_cliente, @cod_qualificacao FROM cd_cliente
WHERE cod_revenda_gerado > 0;
COMMIT;


