/*
Data: 01/07/2019
Objetivo: Retornar cadastro de revenda com gerente de contas associado.
Query modificada de acordo com solicitação de Mauricio Mota
Para retorar os seguintes campos.
códigoDeCliente, CodigoDeRevenda, Fantasia, RazãoSocial, cnpj, cidade, estado,
data de Cadastro, situação, Codigo do Gerente, Nome do Gerente, Contato Revenda,
E-mail Contato, telefone do Contato, Cargo do contato
*/
SELECT
  cliente.cod_cliente AS 'Código Cliente',
  cliente.cod_revenda_gerado As 'Código Revenda',
  cliente.nome_cliente AS 'Fantasia',
  cliente.razao_social As 'Razao Social',
  cliente.cnpj As 'Cnpj',
  endereco.cidade AS 'Cidade',
  endereco.sigla_uf AS 'Estado',
  cliente.dt_implant As 'Data Cadastro',
  CASE
    WHEN cliente.situacao = 0 THEN "INATIVO"
    WHEN cliente.situacao = 1 THEN "ATIVO"
    WHEN cliente.situacao = 2 THEN "SUSPECT"
    WHEN cliente.situacao = 3 THEN "PROSPECT"
    WHEN cliente.situacao = 9 THEN "BLOQUEADO"
    WHEN cliente.situacao = 10 THEN "CANCELADO"
    ELSE "DESCONHECIDO"
  END AS 'Situação',  
  colab.cod_colaborador AS 'Código Do Gerente',
  colab.nome_colaborador As 'Vendedor',
  contato.nome_contato As 'contato',
  contato.email As 'email contato',
  foneCli.ddd As 'ddd',
  foneCli.telefone As 'telefone',  
  contato.cargo As 'cargo'
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

Where cliente.cod_revenda_gerado > 0 ;
