/*SELECT *
FROM dbo.Pedido AS ped
WHERE ped.idPedidoStatus = 6
*/

DECLARE @DTFIM DATE
SET @DTFIM = GETDATE()

SELECT (cli.nome +' '+cli.sobrenome) AS nome , cli.email,
FORMAT( cli.dataNascimento, 'dd/MM/yyyy','pt-BR') AS dtNascimento,
CAST(DATEDIFF(DAY,cli.dataNascimento , @DTFIM) / 365.25 AS INT) AS Idade,
CASE cli.tiposexo
	WHEN '0' THEN 'Masculino'  
	WHEN '1' THEN 'Feminino'  
	ELSE 'Indefinido'  
END AS sexo, cli.telefone, cli.celular, cliend.Titulo, cliend.Rua, cliend.Numero, 
cliend.Complemento, cliend.Bairro, cliend.Cidade, uf.Nome AS Uf, cliend.Cep, 
FORMAT(ped.DataInclusao, 'dd/MM/yyyy','pt-BR') AS [InclusãoPedido], af.RazaoSocial,

ped.id as pedido, op.Codigo,op.DescricaoComercial, item.quantidade, item.valor
FROM cliente AS cli JOIN pedido AS ped
ON cli.id = ped.idCliente
JOIN afiliado AS af
ON ped.idAfiliado = af.id

JOIN clienteEndereco AS cliend
ON cli.id = cliend.IdCliente
JOIN Estado AS uf
ON cliend.IdEstado = uf.Id
JOIN pedidoItem AS item
ON item.idPedido = ped.Id
JOIN ProdutoOpcao AS op
ON op.Id = item.IdProdutoOpcao
WHERE ped.IdPedidoStatus = 6