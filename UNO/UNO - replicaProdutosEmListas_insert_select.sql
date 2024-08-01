/*
Data: 2017-04-06
Objetivo: Inserir os produto da familia comercial 27 IpSwitch nas demais listas de Preço com o mesmo valor.
Projeto: Projeto: Importação Produtos IpSwitch
*/
#Lista de variaveis abaixo descomente par utilizar removendo o #.
#SET @tb_preco = 'AIM7';
#SET @tb_preco = 'BARRACUDA';
#SET @tb_preco = 'GOLD';
#SET @tb_preco = 'NS';
#SET @tb_preco = 'PLATINUM';
#SET @tb_preco = 'SILVER';
#SET @tb_preco = 'SOLO';

INSERT INTO cd_preco_item (qtd_min,tb_preco,cod_produto,preco_unit,situacao,dt_alteracao,ind_ajuste_preco,
									qtd_ponto,ind_variacao_diferenciada,perc_variacao_max,perc_variacao_min,preco_minimo,
									preco_maximo,precificacao)
SELECT qtd_min,@tb_preco,cod_produto,preco_unit,situacao,dt_alteracao,ind_ajuste_preco,qtd_ponto,
			ind_variacao_diferenciada,perc_variacao_max,perc_variacao_min,preco_minimo,preco_maximo,precificacao
	FROM cd_preco_item 
		WHERE tb_preco = 'REGISTRADA' AND 
		cod_produto IN (select cod_produto from cd_produto where cod_familia_comercial = 27);
