-- Query antiga
SELECT 
    CASE WHEN ((ROW_NUMBER() OVER (ORDER BY saldo.qtdlic)) % 2) = 1 THEN '#efefef' ELSE '#ffffff' END
    , saldo.codigo
    , entrada.descComercial
    , entrada.nome
    , CAST(entrada.qtdlic AS VARCHAR)
    , CAST((entrada.qtdlic-saldo.qtdlic) AS VARCHAR) 
    , CAST(saldo.qtdlic AS VARCHAR) 
from		 
    (select opcao.Codigo as codigo,
                opcao.DescricaoComercial as descComercial, 
                opcao.Nome as nome,
                COUNT(licenca.Chave) as qtdlic
                from SQL_AXYSWEB.ECommerceAfiliados.dbo.ProdutoOpcao as opcao 
                join SQL_AXYSWEB.ECommerceAfiliados.dbo.ProdutoLicenca as licenca
                    on opcao.Id = licenca.IdProdutoOpcao
                            group by opcao.Codigo, opcao.DescricaoComercial, opcao.nome) entrada
    right outer join 				
                            
    (select opcao.Codigo as codigo,count(licenca.id) as qtdlic
            from SQL_AXYSWEB.ECommerceAfiliados.dbo.ProdutoOpcao as opcao 
            left join SQL_AXYSWEB.ECommerceAfiliados.dbo.ProdutoLicenca as licenca
            on opcao.Id = licenca.IdProdutoOpcao
            group by opcao.Codigo, licenca.IdPedidoItem, opcao.disponivel , opcao.excluido
            having licenca.IdPedidoItem is null and opcao.disponivel = 'TRUE' and opcao.excluido = 'false') saldo
    on entrada.codigo = saldo.codigo
    WHERE entrada.qtdlic IS NOT NULL

-- Query nova
SELECT 
    CASE WHEN ((ROW_NUMBER() OVER (ORDER BY ProdutoOpcao.DescricaoComercial)) % 2) = 1 THEN '#efefef' ELSE '#ffffff' END
    , ProdutoOpcao.DescricaoComercial
    , ProdutoOpcao.Nome
    , (SELECT COUNT(ProdutoLicenca.IdProdutoOpcao) FROM SQL_AXYSWEB.ECommerceAfiliados.dbo.ProdutoLicenca WHERE ProdutoLicenca.IdProdutoOpcao = ProdutoOpcao.Id) AS Entrada
    , (SELECT COUNT(ProdutoLicenca.IdProdutoOpcao) FROM SQL_AXYSWEB.ECommerceAfiliados.dbo.ProdutoLicenca WHERE ProdutoLicenca.IdProdutoOpcao = ProdutoOpcao.Id AND ProdutoLicenca.IdPedidoItem IS NOT NULL) AS Saida
    , (SELECT COUNT(ProdutoLicenca.IdProdutoOpcao) FROM SQL_AXYSWEB.ECommerceAfiliados.dbo.ProdutoLicenca WHERE ProdutoLicenca.IdProdutoOpcao = ProdutoOpcao.Id) - (SELECT COUNT(ProdutoLicenca.IdProdutoOpcao) FROM SQL_AXYSWEB.ECommerceAfiliados.dbo.ProdutoLicenca WHERE ProdutoLicenca.IdProdutoOpcao = ProdutoOpcao.Id AND ProdutoLicenca.IdPedidoItem IS NOT NULL) AS Saldo
FROM SQL_AXYSWEB.ECommerceAfiliados.dbo.ProdutoOpcao
WHERE (SELECT COUNT(ProdutoLicenca.IdProdutoOpcao) FROM SQL_AXYSWEB.ECommerceAfiliados.dbo.ProdutoLicenca WHERE ProdutoLicenca.IdProdutoOpcao = ProdutoOpcao.Id) > 0
    AND ProdutoOpcao.disponivel = 1 
    AND ProdutoOpcao.excluido = 0;
