Select
  cliente.cod_cliente As 'codigo cliente',
  cliente.cod_revenda_gerado As 'Código Revenda',
  cliente.razao_social As 'Razao Social',
  cliente.cnpj As 'Cnpj',
  cliente.dt_implant As 'Data Cadastro',
  cliente.tb_preco As 'Nivel',
  cliente.nome_cliente As 'nome do cliente',
  
  endereco.endereco As 'endereco',
  endereco.numero As numero,
  endereco.complemento_end As 'complemento',
  endereco.bairro As 'bairro',
  endereco.cidade As 'cidade',
  endereco.sigla_uf As 'uf',
  endereco.cep As 'cep',
  
  contato.cod_contato As 'codigo contato',
  contato.nome_contato As 'contato',
  contato.cargo As 'cargo',
  contato.email As 'email contato',
  
  foneCli.cod_cliente As 'cod cliente',
  foneCli.ddd As 'ddd',
  foneCli.telefone As 'telefone',
  
  colab.nome_colaborador As 'Vendedor'
From
  cd_cliente AS cliente Inner Join cd_cliente_contato AS contato
  
  On cliente.cod_cliente = contato.cod_cliente 
  Inner Join cd_cliente_contato_telefone AS contatoFone
    On contato.cod_cliente = contatoFone.cod_cliente 
	 And contato.cod_contato = contatoFone.cod_contato 
	 Inner Join cd_cliente_endereco AS endereco
    On endereco.cod_cliente = cliente.cod_cliente 
	 Inner Join cd_cliente_telefone AS foneCli
    On contatoFone.cod_telefone = foneCli.cod_telefone 
	 And contatoFone.cod_cliente = foneCli.cod_cliente 
	 Inner Join sg_colaborador AS colab
	 On cliente.cod_colaborador =  colab.cod_colaborador

Where cliente.cod_revenda_gerado > 0 And cliente.situacao = 1
group by contato.cod_contato;
