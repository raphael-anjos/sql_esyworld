Select
  cd_cliente_contato.nome_contato,
  cd_cliente_contato.email,
  cd_cliente_contato.cargo,
  cd_cliente_telefone.ddd,
  cd_cliente_telefone.telefone,
  cd_cliente.nome_cliente
From
  cd_cliente Inner Join
  cd_cliente_telefone On cd_cliente_telefone.cod_cliente =
    cd_cliente.cod_cliente Inner Join
  cd_cliente_contato_telefone On cd_cliente_contato_telefone.cod_telefone =
    cd_cliente_telefone.cod_telefone And cd_cliente_contato_telefone.cod_cliente
    = cd_cliente_telefone.cod_cliente Inner Join
  cd_cliente_contato On cd_cliente_contato.cod_cliente =
    cd_cliente_contato_telefone.cod_cliente And cd_cliente_contato.cod_contato =
    cd_cliente_contato_telefone.cod_contato
    where cd_cliente.cod_revenda_gerado > 0 and cd_cliente_contato.nome_contato <> 'korm'