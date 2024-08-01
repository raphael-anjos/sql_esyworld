/*2016/05/18
Retorna cadastro de todas as Revendas com seguinte atributos
CodCliente, Cod_Revenda, Razão Social, Cnpj, Dta Cadastro, Cidade, Estado*/
SELECT cli.cod_cliente AS 'Código de Cliente', cli.cod_revenda_gerado AS 'Código Revenda',
cli.razao_social AS 'Razão Social', cli.cnpj AS 'Cnpj', cli.dt_implant AS 'Data Cadastro',
cliend.cidade AS 'Cidade', cliend.sigla_uf AS 'UF', CASE cli.situacao WHEN 0 THEN 'Inativo' WHEN 1 THEN 'Ativo' WHEN 2 THEN 'Suspect' WHEN 3 THEN 'Prospect' WHEN 9 THEN 'Bloqueado' WHEN 10 THEN 'Cancelado' END AS 'Situacao'
FROM cd_cliente AS cli
JOIN cd_cliente_endereco AS cliend ON cli.cod_cliente = cliend.cod_cliente
WHERE cli.cod_revenda_gerado > 0 ;

/*Retorna os contatos das Revendas*/
Select
	cd_cliente_telefone.cod_cliente As `cod cliente`,
	cd_cliente_contato.cod_contato As `codigo contato`,
	cd_cliente_contato.nome_contato As contato,
	cd_cliente_contato.email As `email contato`,
	cd_cliente_telefone.ddd As ddd,
	cd_cliente_telefone.telefone As telefone,
	cd_cliente_contato.cargo As cargo

From
  cd_cliente Inner Join cd_cliente_contato 
  On cd_cliente.cod_cliente =
	cd_cliente_contato.cod_cliente Inner Join  cd_cliente_contato_telefone
    On cd_cliente_contato.cod_cliente = cd_cliente_contato_telefone.cod_cliente And
    cd_cliente_contato.cod_contato =  cd_cliente_contato_telefone.cod_contato Inner Join
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
  cd_cliente.cod_revenda_gerado > 0 And cd_cliente.cod_cliente in (select cli.cod_cliente 
									from cd_cliente as cli
									where cli.cod_revenda_gerado > 0) ;
  
  
  
