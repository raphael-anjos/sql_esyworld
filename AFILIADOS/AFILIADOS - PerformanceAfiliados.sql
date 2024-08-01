/*Data: 2018-05-22
Objetivo: Extrair da Base de Dados da loja dados cadastrais dos afiliados, qtd de pedidos finalizados
com a data do ultimo pedido finalizado
*/
select af.id, af.razaosocial, af.telefone, af.celular, af.email, af.telefoneatendimento,
af.emailatendimento, af.pessoacontato, af.rua, af.numero, af.complemento, af.bairro,
af.cidade, af.cep, uf.nome, count(ped.idafiliado) as 'qtd Pedido Finalizados', 
max(ped.datafinalizacao) as 'Ultima Venda'
from dbo.estado as uf join dbo.afiliado as af 
on uf.id = af.estado
join dbo.pedido as ped
on af.id = ped.idafiliado
where ped.idcliente is not null and idpedidostatus = 6
group by af.id, af.razaosocial, af.telefone, af.celular, af.email, af.telefoneatendimento,
af.emailatendimento, af.pessoacontato, af.rua, af.numero, af.complemento, af.bairro,
af.cidade, af.cep, uf.nome;