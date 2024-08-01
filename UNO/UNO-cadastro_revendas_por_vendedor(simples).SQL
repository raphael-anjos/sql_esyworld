SELECT revenda.codigo_cliente AS 'Código Cliente',
       revenda.cod_revenda AS 'Código Reveda',
	    revenda.cnpj AS 'CNPJ', 
	    revenda.fantasia AS 'Fantasia'
FROM 	   
(SELECT
  cliente.cod_cliente AS 'codigo_cliente',
  cliente.cod_revenda_gerado As 'cod_revenda',
  cliente.nome_cliente AS 'fantasia',
  cliente.razao_social As 'razao_social',
  cliente.cnpj As 'cnpj',
  endereco.cidade AS 'cidade',
  endereco.sigla_uf AS 'estado',
  cliente.dt_implant As 'data_cadastro',
  CASE
    WHEN cliente.situacao = 0 THEN "INATIVO"
    WHEN cliente.situacao = 1 THEN "ATIVO"
    WHEN cliente.situacao = 2 THEN "SUSPECT"
    WHEN cliente.situacao = 3 THEN "PROSPECT"
    WHEN cliente.situacao = 9 THEN "BLOQUEADO"
    WHEN cliente.situacao = 10 THEN "CANCELADO"
    ELSE "DESCONHECIDO"
  END AS 'Situação',

  colab.cod_colaborador AS 'codigo_vendedor',
  colab.nome_colaborador As 'vendedor'

FROM 
cd_cliente AS cliente  INNER JOIN sg_colaborador AS colab
On cliente.cod_colaborador = colab.cod_colaborador
INNER JOIN cd_cliente_endereco AS endereco
ON cliente.cod_cliente = endereco.cod_cliente 
Where cliente.cod_revenda_gerado > 0 AND cliente.cod_colaborador IN (7525,4678)) AS revenda
ORDER BY data_cadastro