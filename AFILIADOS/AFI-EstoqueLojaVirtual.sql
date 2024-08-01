-- Gera posição de Estoque da Loja de Afiliados
-- Relatório a ser enviado para lista estoquelojavirtual@esy.com.br
USE Esy_Afiliados;
select produtoopcao.codigo
    , produtoopcao.descricaocomercial
    , produtoopcao.nome
    , (select count(produtolicenca.idprodutoopcao) from dbo.produtolicenca where produtolicenca.idprodutoopcao = produtoopcao.id) as entrada
    , (select count(produtolicenca.idprodutoopcao) from dbo.produtolicenca where produtolicenca.idprodutoopcao = produtoopcao.id and produtolicenca.idpedidoitem is not null) as saida
    , (select count(produtolicenca.idprodutoopcao) from dbo.produtolicenca where produtolicenca.idprodutoopcao = produtoopcao.id) - (select count(produtolicenca.idprodutoopcao) from dbo.produtolicenca where produtolicenca.idprodutoopcao = produtoopcao.id and produtolicenca.idpedidoitem is not null) as saldo
from dbo.produtoopcao
where (select count(produtolicenca.idprodutoopcao) from dbo.produtolicenca where produtolicenca.idprodutoopcao = produtoopcao.id) > 0
    and produtoopcao.disponivel = 1 
    and produtoopcao.excluido = 0;