/*Retorna a posição deo estoque de todos os produtos da loja*/

use Esy_Afiliados;
select opcao.Codigo, opcao.DescricaoComercial, opcao.Nome, COUNT(licenca.Chave) as Entrada, 
	COUNT(licenca.Chave)- qtd_disponivel.total as Vendido, qtd_disponivel.total as Saldo
	from dbo.ProdutoOpcao as opcao join dbo.ProdutoLicenca as licenca
	on opcao.Id = licenca.IdProdutoOpcao
	join (select opcao.Codigo, opcao.Nome, COUNT(licenca.Chave) as total
				from dbo.ProdutoOpcao as opcao join dbo.ProdutoLicenca as licenca
				on opcao.Id = licenca.IdProdutoOpcao
				where licenca.IdPedidoItem is null --and opcao.Codigo not like 'kl%'
				group by opcao.Codigo, opcao.Nome) qtd_disponivel on qtd_disponivel.Codigo = opcao.Codigo
group by opcao.Codigo,opcao.DescricaoComercial, opcao.Nome, qtd_disponivel.total
ORDER BY 2;