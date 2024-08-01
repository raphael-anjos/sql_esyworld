UPDATE cd_cliente
SET email_cobranca = CONCAT(email_cobranca, ';boleto@esy.com.br')
WHERE email_cobranca NOT LIKE '%boleto@esy%'