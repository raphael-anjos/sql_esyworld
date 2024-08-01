SELECT distinct revenda.cod_revenda AS 'Código Reveda',
		 revenda.razao_social AS 'Nome Revenda',
		 revenda.codigo_vendedor AS 'Codigo Vendedor', 
		 revenda.regiao AS 'Região',
		 revenda.estado AS 'Estado',
		 revenda.cidade AS 'Cidade'
		 

    
FROM 	   
(SELECT
  cliente.razao_social AS 'razao_social',
  endereco.cidade AS 'cidade',
  endereco.sigla_uf AS 'estado',
  cliente.cod_revenda_gerado As 'cod_revenda',
  cliente.situacao AS 'situação',
  regiao.desc_abrev AS 'regiao',
  colab.cod_colaborador AS 'codigo_vendedor'


FROM 
cd_cliente AS cliente  INNER JOIN sg_colaborador AS colab
On cliente.cod_colaborador = colab.cod_colaborador
INNER JOIN cd_cliente_endereco AS endereco
ON cliente.cod_cliente = endereco.cod_cliente
LEFT JOIN cd_cliente_contato AS contato
ON contato.cod_cliente = cliente.cod_cliente
LEFT JOIN cd_regiao AS regiao
ON cliente.cod_regiao = regiao.cod_regiao
Where cliente.cod_revenda_gerado > 0 ) AS revenda
WHERE revenda.razao_social IS NOT NULL
GROUP BY revenda.razao_social
ORDER BY revenda.razao_social