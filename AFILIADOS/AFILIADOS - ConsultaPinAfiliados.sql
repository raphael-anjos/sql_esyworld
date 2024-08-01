/*
Data: 2021-07-19
Objetivo: Retorna dados do produto por chave pin de afiliado
*/


SELECT ProdutoAfiliadoPIN.IdAfiliado,ProdutoAfiliadoPIN.pin, ProdutoAfiliadoPIN.IdPedidoItem,ProdutoAfiliadoPIN.Valor,
ProdutoOpcao.Id, ProdutoOpcao.codigo, ProdutoOpcao.DescricaoComercial, ProdutoOpcao.Nome
FROM ProdutoAfiliadoPIN JOIN ProdutoOpcao
ON ProdutoAfiliadoPIN.IdProdutoOpcao = ProdutoOpcao.Id
WHERE ProdutoAfiliadoPIN.pin in ('KIS001120A9R68DK','KIS1721U5X89NMN')