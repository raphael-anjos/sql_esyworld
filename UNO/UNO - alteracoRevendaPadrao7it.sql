###########################################################################
##atualizção 7it
UPDATE cd_cliente
SET observacao = CONCAT(observacao,'  ---  ALTERADA REV.PADRAO 1979 >> 1865'), 
cod_colaborador_revenda = 1865
WHERE cod_colaborador_revenda = 1979

UPDATE cd_cliente
SET observacao = 'ALTERADA REV.PADRAO 1979 >> 1865'
WHERE cod_colaborador_revenda = 1865 and observacao is null

#########################################