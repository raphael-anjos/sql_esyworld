SELECT cod_cliente,email_cobranca, email_nfe
FROM cd_cliente
WHERE email_cobranca NOT LIKE '%boleto@esy%'