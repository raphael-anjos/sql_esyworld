/*Data: 2018-01-10
Objetivo: buscar Chaves disponiveis na loja por codigo de Produto.
*/

DECLARE @codigoDoProduto VARCHAR(45)
SET @codigoDoProduto = '520174'


SELECT TOP 8 (op.codigo), lic.id, lic.IdProdutoOpcao, lic.Chave, lic.IdPedidoItem
FROM ProdutoOpcao AS op INNER JOIN ProdutoLicenca AS lic
ON op.Id = lic.IdProdutoOpcao
WHERE op.Disponivel = 1 AND op.Excluido = 0 
AND lic.IdPedidoItem IS NULL AND op.Codigo = @codigoDoProduto
ORDER BY LIC.ID DESC;

BEGIN TRANSACTION;
DELETE ProdutoLicenca
WHERE id >= 5572 and IdProdutoOpcao = 84;
COMMIT;
ROLLBACK;