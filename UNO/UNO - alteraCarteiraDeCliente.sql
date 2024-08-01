/*Data: 2017-07-03
Objetivo: Realizar a alteração de carteira de clientes da 
vendedora IVANETE para Vendedora Nathalia.
Onde temos as variaveis @vendedorDe e @vendedorPara
*/
START TRANSACTION;
#Atributo das Variaveis
SET @vendedorDe = 2457;
SET @vendedorPara = 3572;

#Retona Qtos Cliente estão associados da Vendedora
SELECT COUNT(cod_cliente)
FROM cd_cliente
WHERE cod_colaborador = @vendedorDe;

#Realiza a troca da carteira de uma vendedora para a outra.
UPDATE cd_cliente
SET cod_colaborador = @vendedorPara
WHERE cod_colaborador = @vendedorDe;

#Retona Qtos Cliente estão associados da Vendedora deverá ser retornado (0)
SELECT COUNT(cod_cliente)
FROM cd_cliente
WHERE cod_colaborador = @vendedorDe;

COMMIT;
ROLLBACK;

