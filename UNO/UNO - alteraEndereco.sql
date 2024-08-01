##BANCO DE DADOS DE CEP.
update db_cep.cepend
set endereco = replace (endereco,'AVENIDA','AV')

update db_cep.cepend
set endereco = replace (endereco,'RODOVIA','ROD')

update db_cep.cepend
set endereco = replace (endereco,'ALAMEDA','AL')

update db_cep.cepend
set endereco = replace (endereco,'TRAVESSA','TRAV')


##ENDEREÇO DOS CLIENTES
SELECT *
FROM cd_cliente_endereco
WHERE endereco like 'EST%'

UPDATE cd_cliente_endereco
SET endereco = UPPER(endereco)

UPDATE cd_cliente_endereco
SET endereco = REPLACE (endereco,'AVENIDA','AV')

UPDATE cd_cliente_endereco
SET endereco = REPLACE (endereco,'ROD.','ROD')

UPDATE cd_cliente_endereco
SET endereco = REPLACE (endereco,'ALAMEDA','AL')

UPDATE cd_cliente_endereco
SET endereco = REPLACE (endereco,'TRAVESSA','TRAV')

UPDATE cd_cliente_endereco
SET endereco = REPLACE (endereco,'ESTRADA','ESTR')



SELECT *
FROM cd_cliente_endereco
WHERE endereco like '%lT%'

###ALTERAÇÕES NO CADASTRO DE CLIENTES

UPDATE cd_cliente_endereco
SET complemento_end = REPLACE(complemento_end,'QUADRA','QDR')

UPDATE cd_cliente_endereco
SET complemento_end = REPLACE(complemento_end,'CONJUNTO','CJ')

UPDATE cd_cliente_endereco
SET complemento_end = REPLACE(complemento_end,'BLOCO','BL')

UPDATE cd_cliente_endereco
SET complemento_end = REPLACE(complemento_end,'SALA','SL')

UPDATE cd_cliente_endereco
SET complemento_end = REPLACE(complemento_end,'LOTE','LT')


###################################################################

UPDATE cd_cliente_endereco
SET endereco = REPLACE(endereco,'QUADRA','QDR')

UPDATE cd_cliente_endereco
SET endereco = REPLACE(endereco,'CONJUNTO','CJ')

UPDATE cd_cliente_endereco
SET endereco = REPLACE(endereco,'BLOCO','BL')

UPDATE cd_cliente_endereco
SET endereco = REPLACE(endereco,'SALA','SL')

UPDATE cd_cliente_endereco
SET endereco = REPLACE(endereco,'LOTE','LT')

UPDATE cd_cliente_endereco
SET endereco = UPPER(endereco)

UPDATE cd_cliente_endereco
SET endereco = REPLACE (endereco,'AVENIDA','AV')

UPDATE cd_cliente_endereco
SET endereco = REPLACE (endereco,'ROD.','ROD')

UPDATE cd_cliente_endereco
SET endereco = REPLACE (endereco,'ALAMEDA','AL')

UPDATE cd_cliente_endereco
SET endereco = REPLACE (endereco,'TRAVESSA','TRAV')

UPDATE cd_cliente_endereco
SET endereco = REPLACE (endereco,'ESTRADA','ESTR')

SELECT *
FROM db_cep.cepend
WHERE endereco like '%BLOCO%'

UPDATE db_cep.cepend
SET endereco = REPLACE(endereco,'QUADRA','QD')

UPDATE db_cep.cepend
SET endereco = REPLACE(endereco,'BLOCO','BL')

UPDATE db_cep.cepend
SET endereco = REPLACE(endereco,'CONJUNTO','CJ')




