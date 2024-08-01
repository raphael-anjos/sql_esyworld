/*Data: 
*/

--RETORNA O VALOR A SER UTILIZADO NO ID IDENTITY DA TABELA TEMPORÁRIA
SELECT nextValue FROM IdentityInfo WHERE EntityName = 'AfiliadoProdutoOpcao';
GO
-- CRIA A TABELA TEMPORÁRIA
CREATE TABLE #TEMPORARIA(
Id BIGINT IDENTITY (22297,1),
IdProdutoOpcao BIGINT,
IdAfiliado BIGINT,
PrecoCusto DECIMAL(18,2),
PrecoVendaProduto DECIMAL(18,2),
PercentualDesconto DECIMAL(18,2) DEFAULT 0,
kormOpcao BIT DEFAULT 0,
CodigoPromocional VARCHAR(200) DEFAULT NULL);

GO
--Retorna o id do afiliado que deve ser passado na variavel @IdAfiliado
--Utilizando como critério o código do Afilaido do ERP.
SELECT Id, Identificador, RazaoSocial, CodigoErp, CodigoRevenda FROM Afiliado WHERE CodigoErp = 132109;
GO
--TABELAS[25-KASPERS_REGI, 26-KASPERS_SILV, 23-KASPERS_GOLD, 24-KASPERS_PLAT] 
--Declara as variaveis a serem utilizadas para o preenchimento da tabela #temporaria com base no select
DECLARE @IdAfiliado INT;
DECLARE @TabelaPreco INT;
SET @IdAfiliado = 484;
SET @TabelaPreco = 25;

INSERT INTO #TEMPORARIA (IdProdutoOpcao, IdAfiliado, PrecoCusto, PrecoVendaProduto)
SELECT prodOpcao.Id AS IdProdutoOpcao, @IdAfiliado AS IdAfiliado, OpcaoPreco.Valor AS PrecoCusto, prodOpcao.PrecoVendaProduto
FROM [dbo].[ProdutoOpcao] AS prodOpcao LEFT JOIN [dbo].[ProdutoOpcaoPreco] AS opcaoPreco
ON prodOpcao.Id = opcaoPreco.IdProdutoOpcao
WHERE opcaoPreco.IdTabelaPreco = @TabelaPreco AND prodOpcao.Codigo LIKE 'KL%MG';

GO
--Retorna todos os registros da tabela temporaria
SELECT * FROM #TEMPORARIA;
GO
--Insere todos os itens da tabela Temporária na tabela definitiva para opção de produto do afiliado.
INSERT INTO AfiliadoProdutoOpcao (Id, IdProdutoOpcao, IdAfiliado, PrecoCusto, PrecoVendaProduto, PercentualDesconto, KormOpcao, CodigoPromocional)
SELECT * FROM #TEMPORARIA;

GO
--Atualiza o IdentityInfo da tabela de AfiliadoProdutoOpcao
UPDATE IdentityInfo SET NextValue = (SELECT MAX(Id)+1 FROM [dbo].[AfiliadoProdutoOpcao]) WHERE EntityName = 'AfiliadoProdutoOpcao';

GO
--Destrói a tabela temporária.
DROP TABLE #TEMPORARIA;

/*select AfiliadoProdutoOpcao.*
from afiliadoprodutoopcao left join ProdutoOpcao
on AfiliadoProdutoOpcao.IdProdutoOpcao = ProdutoOpcao.id
where AfiliadoProdutoOpcao.IdAfiliado = 369 and ProdutoOpcao.Id LIKE 'KL%MG';


UPDATE IdentityInfo
SET NextValue = (SELECT MAX(Id)+1 FROM [dbo].[AfiliadoProdutoOpcao])
WHERE EntityName = 'AfiliadoProdutoOpcao';


INSERT INTO AfiliadoProdutoOpcao (Id, IdProdutoOpcao, IdAfiliado, PrecoCusto, PrecoVendaProduto, PercentualDesconto, KormOpcao, CodigoPromocional)
SELECT * FROM #TEMPORARIA;

DROP TABLE #TEMPORARIA;


/*
DELETE #TEMPORARIA 
FROM #TEMPORARIA LEFT JOIN ProdutoOpcao
ON #TEMPORARIA.IdProdutoOpcao = ProdutoOpcao.Id 
WHERE ProdutoOpcao.Codigo LIKE 'KL4863%MG';
GO
DELETE #TEMPORARIA 
FROM #TEMPORARIA LEFT JOIN ProdutoOpcao
ON #TEMPORARIA.IdProdutoOpcao = ProdutoOpcao.Id 
WHERE ProdutoOpcao.Codigo LIKE 'KL4741%MG';
GO
DELETE #TEMPORARIA 
FROM #TEMPORARIA LEFT JOIN ProdutoOpcao
ON #TEMPORARIA.IdProdutoOpcao = ProdutoOpcao.Id 
WHERE ProdutoOpcao.Codigo LIKE 'KL4743%MG';
GO
DELETE #TEMPORARIA 
FROM #TEMPORARIA LEFT JOIN ProdutoOpcao
ON #TEMPORARIA.IdProdutoOpcao = ProdutoOpcao.Id 
WHERE ProdutoOpcao.Codigo LIKE 'KL4742%MG';
GO
DELETE #TEMPORARIA 
FROM #TEMPORARIA LEFT JOIN ProdutoOpcao
ON #TEMPORARIA.IdProdutoOpcao = ProdutoOpcao.Id 
WHERE ProdutoOpcao.Codigo LIKE 'KL4746%MG';
*/

/*
SELECT Id, IdTabelaPreco, Identificador, RazaoSocial, CodigoErp, CodigoRevenda
FROM Afiliado 
WHERE CodigoErp = 113328

SELECT * FROM Afiliado WHERE CodigoErp = 113328



WHERE RazaoSocial like '%agas%'

*/