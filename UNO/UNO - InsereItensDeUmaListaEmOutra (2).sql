/*Data:2018-03-26
Objetivo: Inserir em uma lista os itens de outra lista
*/
START TRANSACTION;
SET @TabelaDe = 'Varejo30';
SET @TabelaPara = 'Baboo' ;

INSERT INTO cd_preco_item (qtd_min,tb_preco,cod_produto,preco_unit,situacao,dt_alteracao,ind_ajuste_preco,qtd_ponto,ind_variacao_diferenciada,perc_variacao_max, perc_variacao_min,preco_minimo,preco_maximo,precificacao)
SELECT qtd_min,@TabelaPara,cod_produto,preco_unit,NOW() AS DATA,situacao,ind_ajuste_preco,qtd_ponto,ind_variacao_diferenciada,perc_variacao_max, perc_variacao_min,preco_minimo,preco_maximo,precificacao
FROM cd_preco_item WHERE tb_preco = @TabelaDe;

UPDATE cd_preco_item
SET dt_alteracao = NOW()
WHERE tb_preco = @TabelaPara;

SELECT *
FROM cd_preco_item
WHERE tb_preco = @TabelaPara;

ROLLBACK:
COMMIT;
