/*Data: 2018-01-10
Objetivo: buscar Chaves disponiveis na loja por codigo de Produto.
Será listado as chaves ordenadas pelo Id da Licença o sistema sempre
entrega as licenças inseridas primeiro ou seja do Id menor para o Maior.
Por este motivo ordenamos de forma Decrescentes do Maior para o Menor.
*/

DECLARE @codigoDoProduto VARCHAR(45)
SET @codigoDoProduto = '520174'
SELECT TOP 10 (op.codigo), lic.id, lic.IdProdutoOpcao, lic.Chave, lic.IdPedidoItem
FROM ProdutoOpcao AS op INNER JOIN ProdutoLicenca AS lic
ON op.Id = lic.IdProdutoOpcao
WHERE op.Disponivel = 1 AND op.Excluido = 0 
AND lic.IdPedidoItem IS NULL AND op.Codigo = @codigoDoProduto
ORDER BY LIC.ID DESC;


/*Aqui vamos remover da tabela que guarda as licenças, onde no id vamos
informar o ultimo número retorando no Select anterior, ou seja o menor
numero do Id
*/
BEGIN TRANSACTION;
DELETE ProdutoLicenca
WHERE id >= 9942 and IdProdutoOpcao = 84 AND IdPedidoItem IS NULL;
COMMIT;
ROLLBACK;