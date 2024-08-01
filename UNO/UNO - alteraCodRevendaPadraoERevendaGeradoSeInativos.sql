##campos da tabela cd_cliente
# cod_revenda_gerado : codigo de revenda do cliente
# cod_colaborador_revenda : codigo de revenda padrão do cliente
# cod_colaborador : codigo do vendedor que atende o cliente
# observacao : observações do cliente

##ALTERA CODIGO DE REVENDA PADRAO E REVENDA GERADA SE ESTES ESTIVEREM INATIVOS NO CADASTRO DE COLABORADOR

UPDATE cd_cliente
SET cod_colaborador_revenda = null
WHERE cod_colaborador_revenda IN (SELECT cod_colaborador
FROM sg_colaborador
WHERE situacao = 0);

UPDATE cd_cliente
SET cod_revenda_gerado = null
WHERE cod_revenda_gerado IN (SELECT cod_colaborador
FROM sg_colaborador
WHERE situacao = 0);