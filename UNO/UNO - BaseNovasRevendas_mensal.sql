SET @ano =  YEAR(CURDATE());
SET @mes =  MONTH(CURDATE());
SELECT DISTINCT
		 
		 revenda.nome_revenda AS 'Nome',
		 revenda.razao_social AS 'Nome Revenda',
		 revenda.nome_contato AS 'Nome Contato',
		 revenda.email_contato AS 'E-mail Contato',
		 revenda.ddd AS 'DDD',
		 revenda.telefone AS 'Telefone Contato',
		 revenda.data_cadastro AS 'Data do Cadastro'

		 

    
FROM 	   
(SELECT
  cliente.cod_cliente AS 'cod_cliente',
  cliente.nome_cliente AS 'nome_revenda',
  cliente.razao_social AS 'razao_social',
  cliente.cnpj AS 'cnpj',
  cliente.cod_revenda_gerado As 'cod_revenda',
  cliente.dt_implant AS 'data_cadastro',
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
Where cliente.cod_revenda_gerado > 0 
AND cliente.situacao = 1
AND telefone_contato.cod_contato = contato.cod_contato 
AND contato.nome_contato <> 'korm'
AND YEAR(cliente.dt_implant) = @ano
AND MONTH(cliente.dt_implant) = @mes-1 ) AS revenda


WHERE revenda.razao_social IS NOT NULL AND revenda.contact_rank <= 3


