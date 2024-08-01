/*Data 2017-10-18
Objetivo: Desvincular chaves dos pedidos de vendas processo utilizado para vendas de teste
na loja, com este processo as chaves passsam a ficar disponivel para vendas reais
*/

UPDATE ProdutoLicenca SET IdPedidoItem = null 
where Chave IN ('A5Q2C-DFVJZ-5NWY2-9R1JN','SS97V-BQEJM-N53Z8-SUHGB',
					'XWKT9-JS39M-1UT93-WXWGF','UBJ8Y-XVX88-6AE2U-UZJ9U');


