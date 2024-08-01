/*Data: 2022-05-30
Objetivo Reemove os items da Lista de destino insere todos os itens da tabela de origem
e atualiza o preço na tabela de destino conforme fator
Neste Caso utilizamos a lista KASPERS_REGI que é a Base.
*/

#FATOR SILVER : 0.97
#FATOR GOLD : 0.95
#FATOR PLATINUM : 0.90


SET @tabelaOrigem = 'KASPERS_REGI';
SET @tabelaDestino = 'KASPERS_SILV';
SET @fator = 0.97;

/* Remove todos os itens da tabelaDestino */
DELETE FROM cd_preco_item WHERE tb_preco = @tabelaDestino;

/* Insere na tabelaDestino os itens da tabelaOrigem */
INSERT INTO cd_preco_item (qtd_min,tb_preco,cod_produto,preco_unit,situacao,dt_alteracao,ind_ajuste_preco,qtd_ponto,ind_variacao_diferenciada,perc_variacao_max,perc_variacao_min,preco_minimo,preco_maximo,precificacao)
SELECT qtd_min,@tabelaDestino,cod_produto,preco_unit,situacao,dt_alteracao,ind_ajuste_preco,qtd_ponto,ind_variacao_diferenciada,perc_variacao_max,perc_variacao_min,preco_minimo,preco_maximo,precificacao
FROM cd_preco_item 
WHERE tb_preco = @tabelaOrigem;

/* Atualiza o preço na tabelaOrigem de acordo com o fator*/
UPDATE cd_preco_item 
SET preco_unit = preco_unit * @fator
WHERE tb_preco = @tabelaDestino;