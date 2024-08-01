/*Data 2019-09-11
Objetivo: alterar o SKU de produtos Kaspersky referente a alteração do KSOS
*/

START TRANSACTION;
UPDATE cd_produto SET cod_produto = REPLACE(cod_produto,'KL4536','KL4542');
UPDATE cd_produto_empresa SET cod_produto = REPLACE(cod_produto,'KL4536','KL4542');
UPDATE cd_preco_item SET cod_produto = REPLACE(cod_produto,'KL4536','KL4542');
COMMIT;
ROLLBACK;