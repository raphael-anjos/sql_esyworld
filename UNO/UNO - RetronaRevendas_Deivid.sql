set @dataInicial = '1900-01-01';
set @dataFinal = NOW();

Select
  cd_cliente.cod_cliente AS 'codigo cliente',
	cd_cliente.cod_revenda_gerado AS 'Código Revenda',
	CASE
	WHEN cd_cliente.situacao = 0 THEN 'INATIVO'
	WHEN cd_cliente.situacao = 1 THEN 'ATIVO'
	WHEN cd_cliente.situacao = 2 THEN 'SUSPECT'
	WHEN cd_cliente.situacao = 3 THEN 'PROSPECT'
	WHEN cd_cliente.situacao = 9 THEN 'BLOQUEADO'
	WHEN cd_cliente.situacao = 10 THEN 'CANCELADO'
	ELSE 'INVÁLIDO'
END AS 'SITUAÇÃO CAD CLIENTE',	
  cd_cliente.razao_social AS 'Razão Social',
  cd_cliente.cnpj AS 'Cnpj',
  cd_cliente.dt_implant AS 'Data Cadastro',
  cd_cliente.nome_cliente AS 'nome do cliente',
  cd_cliente_endereco.endereco As endereco,
  cd_cliente_endereco.numero As numero,
  cd_cliente_endereco.complemento_end As complemento,
  cd_cliente_endereco.bairro As bairro,
  cd_cliente_endereco.cidade As cidade,
  cd_cliente_endereco.sigla_uf As uf,
  cd_cliente_endereco.cep As cep,
  cd_cliente_contato.cod_contato As 'codigo contato',
  cd_cliente_contato.nome_contato As contato,
  cd_cliente_contato.cargo As cargo,
  cd_cliente_contato.email As 'email contato',
  cd_cliente_telefone.cod_cliente As 'cod cliente',
  cd_cliente_telefone.ddd As ddd,
  cd_cliente_telefone.telefone As telefone,
  sg_colaborador.nome_colaborador As Vendedor
	
	
	
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
Where
  cd_cliente.cod_revenda_gerado > 0 And cd_cliente.dt_implant between @dataInicial and @dataFinal;