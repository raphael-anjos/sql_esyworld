-- Realiza a consulta dos dados do cliente utilizando o e-mail deste como parametro
SELECT *
FROM cliente
WHERE email = 'anemagro@gmail.com';


UPDATE cliente
SET email = 'anemagro@gmail.com', senha='S7vGbc3zkyEJgW6iO+MpRg=='
WHERE id = 5520

-- Retorna os dados de um pedido incomm processado normalmente.
SELECT * FROM pedido WHERE id IN (243123);
/*
-- Executa a transação atualizando o valor da tag no pedido
BEGIN TRANSACTION; 
UPDATE PEDIDO 
SET IdPedidoStatus = 6 , 
ValorTotal = 99.90 , 
ValorParcela = ValorTotal, 
ValorTotalParcelado = ValorTotal, 
EhResgate = 1,
IdFormaPagamento = NULL
WHERE ID = 243907
COMMIT;
rollback;
*/
-- retorna os dados do item do pedido utilizando com paramentro o id do pedido
SELECT *
FROM PedidoItem
WHERE IdPedido IN (243123,243907);

-- Retorna licenças disponiveis por opção de produto.
SELECT * 
FROM produtolicenca
WHERE idPedidoItem IS NULL AND IdProdutoOpcao = 100;


SELECT *
from incommRequisicao
WHERE IdPedidoItem IN (13480,13499)


