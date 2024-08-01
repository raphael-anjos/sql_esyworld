/*Retorna a posição de Estoque da loja totalizando entrada e posição de estoque disponivel
Retorna o item mesmo que não se tenha estoque disponivel*/
use EcommerceAfiliados;
select saldo.codigo as 'Código', entrada.descComercial as 'Descrição Comercial', 
		 entrada.nome as 'Opção', entrada.qtdlic as 'Entrada', 
		 (entrada.qtdlic-saldo.qtdlic) as 'Vendidos', saldo.qtdlic as 'Disponível' 
			from		 
				
				
				(select opcao.Codigo as codigo,
						  opcao.DescricaoComercial as descComercial, 
						  opcao.Nome as nome,
						  COUNT(licenca.Chave) as qtdlic
							from dbo.ProdutoOpcao as opcao join dbo.ProdutoLicenca as licenca
								on opcao.Id = licenca.IdProdutoOpcao
									 group by opcao.Codigo, opcao.DescricaoComercial, opcao.nome) as entrada
				right join 				
								
				(select opcao.Codigo as codigo,count(licenca.id) as qtdlic
						from dbo.ProdutoOpcao as opcao left join dbo.ProdutoLicenca as licenca
						on opcao.Id = licenca.IdProdutoOpcao
						group by opcao.Codigo, licenca.IdPedidoItem, opcao.disponivel , opcao.excluido
						having licenca.IdPedidoItem is null and opcao.disponivel = 'TRUE' and opcao.excluido = 'false') as saldo
				on entrada.codigo = saldo.codigo


/*Primeira Versão se não tiver em Estoque não Retorna o Nome o Produto na Lista*/
select opcao.Codigo, opcao.DescricaoComercial, opcao.Nome, COUNT(licenca.Chave) as Entrada, 
	COUNT(licenca.Chave)- qtd_disponivel.total as Vendido, qtd_disponivel.total as Saldo
	from dbo.ProdutoOpcao as opcao join dbo.ProdutoLicenca as licenca
	on opcao.Id = licenca.IdProdutoOpcao
	join (select opcao.Codigo, opcao.Nome, COUNT(licenca.Chave) as total
				from dbo.ProdutoOpcao as opcao join dbo.ProdutoLicenca as licenca
				on opcao.Id = licenca.IdProdutoOpcao
				where licenca.IdPedidoItem is null 
				group by opcao.Codigo, opcao.Nome) qtd_disponivel on qtd_disponivel.Codigo = opcao.Codigo
group by opcao.Codigo,opcao.DescricaoComercial, opcao.Nome, qtd_disponivel.total;


select opcao.Codigo, opcao.DescricaoComercial, opcao.Nome ,count(licenca.id) as saldo
	from dbo.ProdutoOpcao as opcao left join dbo.ProdutoLicenca as licenca
	on opcao.Id = licenca.IdProdutoOpcao
	group by opcao.Codigo, opcao.DescricaoComercial, opcao.Nome,licenca.IdPedidoItem, opcao.disponivel , opcao.excluido
	having licenca.IdPedidoItem is null and opcao.disponivel = 'TRUE' and opcao.excluido = 'false';


