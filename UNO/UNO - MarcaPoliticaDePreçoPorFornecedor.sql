/*DATA: 2019-12-03
Objetivo: Deixar marcado a politica de preço de produto de uma determinado Fornecedor
*/

START TRANSACTION;
SET @fornecedor = 11743;

UPDATE cd_produto
SET ind_politica_preco = 1
WHERE cod_fornecedor = @fornecedor;

ROLLBACK;
COMMIT;


