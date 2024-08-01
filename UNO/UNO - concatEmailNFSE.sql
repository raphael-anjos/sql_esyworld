UPDATE cd_cliente 
SET email_nfe = CONCAT(email_nfe,";nfse@esy.com.br")
WHERE situacao <> 0 ;