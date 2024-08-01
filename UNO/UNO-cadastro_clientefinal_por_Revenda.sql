SELECT DISTINCT
		 
       revenda.cod_cliente AS 'Codigo do Cliente',
		 revenda.razao_social AS 'Razão Social',
		 revenda.nome_cliente AS 'Fantasia',
		 revenda.tipo_cliente AS 'Tipo Cliente',
		 CASE
		 	WHEN revenda.cnpj IS NULL THEN insert(insert(insert(revenda.cpf, 10,0,'-'),7,0,'.'),4,0,'.')
		 	ELSE insert(insert(insert(INSERT(revenda.cnpj,13,0,'-'),9,0,'/'),6,0,'.'),3,0,'.')
		 END AS 'CNPJ/CPF',	
		 revenda.estado AS 'Estado',
		 revenda.cidade AS 'Cidade',
		 revenda.nome_contato AS 'Nome Contato',
		 revenda.email_contato AS 'E-mail Contato',
		 revenda.ddd AS 'DDD',
		 insert(revenda.telefone,5,0,'-') AS 'Telefone Contato',
		 revenda.cod_revenda AS 'Código Revenda Padrão'


		 

    
FROM 	   
(SELECT
  cliente.cod_cliente AS 'cod_cliente',
  cliente.nome_cliente AS 'nome_cliente',
  cliente.razao_social AS 'razao_social',
  cliente.tp_cliente AS 'tipo_cliente',
  cliente.cnpj AS 'cnpj',
  contato.cpf AS 'cpf',
  cliente.cod_colaborador_revenda As 'cod_revenda',
  cliente.situacao AS 'situação',
  endereco.sigla_uf AS 'estado',
  endereco.cidade AS 'cidade',
  endereco.endereco AS 'logradouro',
  endereco.numero AS 'num_logradouro',
  endereco.cep AS 'cep',
  endereco.bairro AS 'bairro',
  colab.cod_colaborador AS 'codigo_vendedor',
  colab.nome_colaborador AS 'nome_vendedor',
  contato.nome_contato AS 'nome_contato',
  contato.email AS 'email_contato',
  telefone.ddd AS 'ddd',
  telefone.telefone AS 'telefone',
  ROW_NUMBER() OVER (PARTITION BY cliente.cod_cliente ORDER BY contato.cod_contato) AS contact_rank
  
FROM 
cd_cliente AS cliente
LEFT JOIN sg_colaborador AS colab
On cliente.cod_colaborador = colab.cod_colaborador
INNER JOIN cd_cliente_endereco AS endereco
ON cliente.cod_cliente = endereco.cod_cliente
LEFT JOIN cd_cliente_contato AS contato
ON contato.cod_cliente = cliente.cod_cliente
LEFT JOIN cd_cliente_telefone AS telefone
ON telefone.cod_cliente = cliente.cod_cliente
LEFT JOIN cd_cliente_contato_telefone AS telefone_contato
ON telefone_contato.cod_telefone = telefone.cod_telefone
LEFT JOIN cd_regiao AS regiao
ON cliente.cod_regiao = regiao.cod_regiao
LEFT JOIN cd_cliente_atividade AS qualifica_cliente
ON qualifica_cliente.cod_cliente = cliente.cod_cliente
LEFT JOIN cd_ramo_atividade AS tb_qualificacao
ON tb_qualificacao.cod_ramo_atividade = qualifica_cliente.cod_ramo_atividade
Where cliente.cod_colaborador_revenda = 2133
AND telefone_contato.cod_contato = contato.cod_contato 
AND contato.nome_contato <> 'korm'
AND endereco.tp_endereco = 'E') AS revenda


WHERE revenda.contact_rank <= 1


