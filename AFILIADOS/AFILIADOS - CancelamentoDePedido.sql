/*Data: 2020-06-04
Para pedidos com 1 item.
Objetivo: Realizar o cancelamento de pedidos nas loja quando
solicitado pelo cliente, desvinculando a chave do pedido
status:
1 : Cesta de Compras - 2 : Aguardadno Pagamento - 3 : Pagamento Aprovado - 4 : Finalizado
5 : Cancelado - 6 : Download Liberado
*/
BEGIN TRANSACTION

DECLARE @PedidoLoja INT
DECLARE @Observacao VARCHAR(MAX)
DECLARE @IdPedidoItemLicenca INT 
DECLARE @IdHist INT 
DECLARE @IdStatus INT
/*Informar aqui o num pedido loja*/
/*Informar aqui o num pedido loja*/
SET @PedidoLoja = 392346 
SET @IdStatus = 5
/*Mensagem a ser inserida nas observações*/
SET @Observacao = 'Cancelamento Solcitado pelo Cliente'
SET @IdHist = (SELECT MAX(id) FROM dbo.PedidoHistorico) + 1
SET @IdPedidoItemLicenca = (SELECT id FROM dbo.PedidoItem WHERE idPedido = @PedidoLoja)

UPDATE dbo.ProdutoLicenca
SET idPedidoItem = NULL
WHERE idPedidoItem = @IdPedidoItemLicenca

UPDATE dbo.PedidoItem
SET Observacoes = @Observacao
WHERE idPedido = @PedidoLoja

UPDATE dbo.Pedido 
SET IdPedidoStatus = @IdStatus, Observacao = @Observacao
WHERE id = @PedidoLoja

INSERT INTO dbo.PedidoHistorico (Id,IdPedido,IdPedidoStatus,Usuario,Data)
VALUES(@IdHist,@PedidoLoja,@IdStatus,'Manual',GETDATE())

ROLLBACK 
COMMIT


/*Abaixo temos o Processo para deixar o pedido como pago isso utilizamdos
quando o boleto é pago depois que o pedido foi cancelado, porém será preciso
através de loja realizar a associação de uma chave ao pedido*/
BEGIN TRANSACTION

DECLARE @PedidoLoja INT
DECLARE @Observacao VARCHAR(MAX)
DECLARE @IdPedidoItemLicenca INT 
DECLARE @IdHist INT 
DECLARE @IdStatus INT
/*Informar aqui o num pedido loja*/
SET @PedidoLoja = 778228
SET @IdStatus = 6
/*Mensagem a ser inserida nas observações*/
SET @Observacao = 'Pagamento do boleto realizado quando pedido havia sido cancelado na loja, pedido reaberto e associado ao mesmo a chave do produto'
SET @IdHist = (SELECT MAX(id) FROM dbo.PedidoHistorico) + 1
SET @IdPedidoItemLicenca = (SELECT id FROM dbo.PedidoItem WHERE idPedido = @PedidoLoja)

UPDATE dbo.PedidoItem
SET Observacoes = @Observacao
WHERE idPedido = @PedidoLoja

UPDATE dbo.Pedido 
SET IdPedidoStatus = @IdStatus, Observacao = @Observacao
WHERE id = @PedidoLoja

INSERT INTO dbo.PedidoHistorico (Id,IdPedido,IdPedidoStatus,Usuario,Data)
VALUES(@IdHist,@PedidoLoja,@IdStatus,'Manual',GETDATE())

ROLLBACK 
COMMIT




