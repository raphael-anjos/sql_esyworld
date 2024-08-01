@Amaral Aprigio, segue abaixo o script para limpeza das tabelas do Plano de Assinaturas.

TRUNCATE TABLE AssinaturaLog;
UPDATE IdentityInfo
   SET NextValue = 1
 WHERE EntityName = 'AssinaturaLog';


TRUNCATE TABLE AssinaturaProduto;
UPDATE IdentityInfo
   SET NextValue = 1
 WHERE EntityName = 'AssinaturaProduto';


DELETE FROM Assinatura;
UPDATE IdentityInfo
   SET NextValue = 1
 WHERE EntityName = 'Assinatura';