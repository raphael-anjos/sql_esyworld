/*Data: 2018-06-04
Retorna chaves e produtos disponiveis na loja.
*/
select op.id, op.codigo, op.descricaocomercial,lic.Chave, lic.DataInclusao
from produtoLicenca as lic join produtoOpcao as op
on lic.idprodutoopcao = op.id
where lic.IdPedidoItem is null;