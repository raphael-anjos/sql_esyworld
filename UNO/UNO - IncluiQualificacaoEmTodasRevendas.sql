/*Data: 2019-08/29
Objetivo: Inserir uma qualificação para todas as Revendas Cadastradas no 
Sistema ativas ou não.
Este processo é realizado para que Canais não precise realizar o processo 1 a 1
O mesmo e´executado sempre que uma nova lista de preços e qualificação de um 
novo Fabricante é inserida no Sistema
*/

START TRANSACTION;

SET @codigoQualificacao = 160;

INSERT INTO cd_cliente_atividade (cod_ramo_atividade, cod_cliente)
SELECT cod_cliente, @codigoQualificacao AS qualificacao
FROM cd_cliente 
WHERE cod_revenda_gerado > 0;

COMMIT; 


/*Atualiza o código RPS da Atividade*/
START TRANSACTION;
SET @tabela = 'SAFETICA';
UPDATE cd_produto_empresa 
SET cod_atividade_rps = '02800'
WHERE cod_produto IN (SELECT cod_produto 
							 FROM cd_preco_item
							 WHERE tb_preco = @tabela);

/*Atualiza o Atributo politica de Preços, para que seja considerada a 
qualificação para associaçõa a tabela de preço correta*/
UPDATE cd_produto
SET ind_politica_preco = 1
WHERE cod_produto IN (SELECT cod_produto 
							 FROM cd_preco_item
							 WHERE tb_preco = @tabela);
COMMIT;

/*Para a query abaixo o retorno deve ser idêntico para conferência da 
quantidade de registros existentes*/
SET @tabela = 'SAFETICA';
SELECT COUNT(cod_produto)
FROM cd_preco_item
WHERE tb_preco = @tabela;

SELECT COUNT(cod_produto)
FROM cd_produto
WHERE cod_produto IN (SELECT cod_produto 
							 FROM cd_preco_item
							 WHERE tb_preco = @tabela);
SELECT COUNT(cod_produto)
FROM cd_produto_empresa
WHERE cod_produto IN (SELECT cod_produto 
							 FROM cd_preco_item
							 WHERE tb_preco = @tabela);
