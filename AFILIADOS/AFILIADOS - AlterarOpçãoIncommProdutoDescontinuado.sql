/*Data: 16/10/2019
Objetivo: Ajustar opção de Produto a PINS DA incomm iseridos na base de dados.
Exemplo: O cliente comprou na loja um CARD que no banco de dados estava associado a uma opção
de produto descontinuada, KIS 3+1 e no momento temos ativo somente o KIS 3.
Apuramos os dados onde IdProdutoOpcao = 69 é o Kis3+1 e IdProdutoOpcao = 100 é o Kis3,
IdAfiliado = 49 é o Id da Incomm.
*/

/*Retornamos todos os PINS Associadoa a opção 69 que não foram resgatados ainda.
Com base nesta consulta alteramos a opção de produto associada a PINS que estão associados
a esta opção.
*/
SELECT *
FROM dbo.ProdutoPIN 
WHERE IdProdutoOpcao = 69 and Pin NOT IN(
SELECT PIN
FROM dbo.IncommRequisicao
WHERE IdAfiliado = 49 AND Serial IS NOT NULL AND idProdutoOpcao = 69)

/*
Realizamos o update para os PINS que não foram resgatados que estão associados a opção 69,
que esta inativa e agora devemos entregar a opção 100
*/ 										
BEGIN TRANSACTION;

UPDATE dbo.ProdutoPIN 
SET IdProdutoOpcao = 100
WHERE IdProdutoOpcao = 69 and Pin NOT IN(
SELECT PIN
FROM dbo.IncommRequisicao
WHERE IdAfiliado = 49 AND Serial IS NOT NULL AND idProdutoOpcao = 69)
COMMIT; 
ROLLBACK;
