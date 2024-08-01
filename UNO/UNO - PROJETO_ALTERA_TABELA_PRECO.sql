/*CLIENTEFINAL >> REGISTRADA OK
NS >> PLATINUM
SOLO >> PLATINUM
AIM7 >> PLATINUM
REVENDA >> REGISTRADA
BLACKBERRY >> BBERRY_DR
BBERRY_STD >> BBERRY_DR
CANALTECH >> VAREJO40
BBERRY_DR >> BLACKBE_STAN
ACRONIS_AUT >> ACRONIS_AUTH
ALIEN VAULT >> ALIENVA_SILV
BARRACUDA >> BARRACU_REGI
PROOFPOINT >> PROOFPO_SILV

REGISTRADA >> KASPERS_REGI
SILVER >> KASPERS_SILV
GOLD >> KASPERS_GOLD
PLATINUM >> KASPERS_PLAT

*/


START TRANSACTION;
SET @nova = 'kaspe';
SET @antiga = 'PROOFPOINT';

UPDATE cd_preco_item SET tb_preco = @nova WHERE tb_preco = @antiga ;
UPDATE at_oportunidade SET tb_preco = @nova WHERE tb_preco = @antiga ;
UPDATE at_oportunidade_item SET tb_preco = @nova WHERE tb_preco = @antiga ;
UPDATE cd_cliente SET tb_preco = @nova WHERE tb_preco = @antiga ;
UPDATE cd_cliente_pda SET tb_preco = @nova WHERE tb_preco = @antiga ;
UPDATE cd_estrut_mercado SET tb_preco = @nova WHERE tb_preco = @antiga ;
UPDATE cd_mkt_place SET tb_preco = @nova WHERE tb_preco = @antiga ;
UPDATE cd_tb_preco_atividade SET tb_preco = @nova WHERE tb_preco = @antiga ;
UPDATE cd_tb_preco_colaborador SET tb_preco = @nova WHERE tb_preco = @antiga ;
UPDATE cd_tb_preco_cond_pagto SET tb_preco = @nova WHERE tb_preco = @antiga ;
UPDATE cd_tb_preco_empresa SET tb_preco = @nova WHERE tb_preco = @antiga ;
UPDATE cd_tb_preco_sigla_uf SET tb_preco = @nova WHERE tb_preco = @antiga ;
UPDATE cd_tb_preco_tp_contribuinte SET tb_preco = @nova WHERE tb_preco = @antiga ;
UPDATE ec_loja_tb_preco SET tb_preco = @nova WHERE tb_preco = @antiga ;
UPDATE pv_pdv SET tb_preco = @nova WHERE tb_preco = @antiga ;
UPDATE pv_tb_preco SET tb_preco = @nova WHERE tb_preco = @antiga ;
UPDATE sg_colaborador SET tb_preco = @nova WHERE tb_preco = @antiga ;
UPDATE sv_plano_servico SET tb_preco = @nova WHERE tb_preco = @antiga ;
UPDATE vd_comissao SET tb_preco = @nova WHERE tb_preco = @antiga ;
UPDATE vd_pedido SET tb_preco = @nova WHERE tb_preco = @antiga ;
UPDATE vd_pedido_item SET tb_preco = @nova WHERE tb_preco = @antiga ;
UPDATE vd_pedido_prog SET tb_preco = @nova WHERE tb_preco = @antiga ;

COMMIT;

SELECT * FROM cd_tb_preco_atividade

					
