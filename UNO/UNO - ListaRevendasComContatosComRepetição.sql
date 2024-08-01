Select
  cd_cliente.cod_cliente As `codigo cliente`,
  cd_cliente.cod_revenda_gerado As 'Código Revenda',
  cd_cliente.razao_social As 'Razao Social',
  cd_cliente.cnpj As 'Cnpj',
  cd_cliente.dt_implant As 'Data Cadastro',
  cd_cliente.tb_preco As `Nivel`,
  cd_cliente.nome_cliente As `nome do cliente`,
  cd_cliente_endereco.endereco As endereco,
  cd_cliente_endereco.numero As numero,
  cd_cliente_endereco.complemento_end As complemento,
  cd_cliente_endereco.bairro As bairro,
  cd_cliente_endereco.cidade As cidade,
  cd_cliente_endereco.sigla_uf As uf,
  cd_cliente_endereco.cep As cep,
  cd_cliente_contato.cod_contato As `codigo contato`,
  cd_cliente_contato.nome_contato As contato,
  cd_cliente_contato.cargo As cargo,
  cd_cliente_contato.email As `email contato`,
  cd_cliente_telefone.cod_cliente As `cod cliente`,
  cd_cliente_telefone.ddd As ddd,
  cd_cliente_telefone.telefone As telefone
  #sg_colaborador.nome_colaborador As Vendedor
From
  cd_cliente Inner Join
  cd_cliente_contato On cd_cliente.cod_cliente =
    cd_cliente_contato.cod_cliente Inner Join
  cd_cliente_contato_telefone
    On cd_cliente_contato.cod_cliente =
    cd_cliente_contato_telefone.cod_cliente And
    cd_cliente_contato.cod_contato =
    cd_cliente_contato_telefone.cod_contato Inner Join
  cd_cliente_endereco
    On cd_cliente_endereco.cod_cliente =
    cd_cliente.cod_cliente Inner Join
  cd_cliente_telefone
    On cd_cliente_contato_telefone.cod_telefone =
    cd_cliente_telefone.cod_telefone And
    cd_cliente_contato_telefone.cod_cliente =
    cd_cliente_telefone.cod_cliente Inner Join
  sg_colaborador On cd_cliente.cod_colaborador =
    sg_colaborador.cod_colaborador
Where cd_cliente.cod_revenda_gerado > 0 And cd_cliente.situacao = 1
group by cd_cliente_contato.cod_contato;

