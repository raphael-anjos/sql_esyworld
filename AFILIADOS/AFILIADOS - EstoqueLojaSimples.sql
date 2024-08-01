/*
select idProdutoOpcao, count(Id)
from ProdutoLicenca
where idpedidoitem is null
group by IdProdutoOpcao
having count(Id)>= 0
*/

select lic.IdProdutoOpcao, po.Codigo, po.DescricaoComercial,
po.Nome, count(lic.Id) as Saldo
from ProdutoOpcao as po join ProdutoLicenca as lic
on po.Id = lic.IdProdutoOpcao
where lic.IdPedidoItem is null and codigo like '52%'
group by lic.IdProdutoOpcao, po.Codigo,po.DescricaoComercial ,po.nome
having count(lic.Id) >= 0

/*
update produtoopcao
set disponivel = 0
where id in (11,59);


SELECT Cidade, SUM(Quantidade) As Total
FROM Vendas
GROUP BY Cidade
HAVING SUM(Quantidade) < 2500;
*/
