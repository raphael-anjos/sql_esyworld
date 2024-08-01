SET @ano =  YEAR(CURDATE());
SET @mes =  MONTH(CURDATE());
SET @trimestre = quarter(CURDATE());
SET @dataReferencia = '2024-04-01';

SELECT DISTINCT 
		 revenda.fantasia AS 'Fanstasia',
		 revenda.razao_social AS 'Razão Social',
		 revenda.contato AS 'Nome Contato',
		 revenda.email_contato AS 'E-mail Contato',
		 revenda.ddd AS 'DDD',
       revenda.telefone AS 'Telefone',
		 pedidonf.ultima_compra AS 'Ultima Compra'
      
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
  colab.nome_colaborador As 'vendedor',
  contato.nome_contato As 'contato',
  contato.email As 'email_contato',
  foneCli.ddd As 'ddd',
  foneCli.telefone As 'telefone',  
  contato.cargo As 'cargo',
  ROW_NUMBER() OVER (PARTITION BY cliente.cod_cliente ORDER BY contato.cod_contato) AS contact_rank
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
Where cliente.cod_revenda_gerado > 0 AND cliente.cod_cliente <> 6 AND cliente.situacao = 1 AND contato.nome_contato <> 'korm') AS revenda

LEFT JOIN

(SELECT  ped.cod_revenda AS cod_revenda, ped.cod_pedido, MAX(nf.dt_emissao) AS ultima_compra 
FROM vd_pedido AS ped 
LEFT JOIN vd_nota_fiscal AS nf ON ped.cod_pedido = nf.cod_pedido
WHERE nf.situacao IN ( 80,70,85 ) AND YEAR(nf.dt_emissao) = @ano AND QUARTER(nf.dt_emissao) = @trimestre-1 AND 
ped.cod_revenda IN (SELECT cod_revenda_gerado 
							FROM cd_cliente
							WHERE cod_revenda_gerado > 0)
GROUP BY ped.cod_revenda
ORDER BY ped.cod_revenda) AS pedidonf

ON revenda.cod_revenda = pedidonf.cod_revenda
WHERE revenda.contact_rank <= 1 AND pedidonf.ultima_compra IS NOT NULL 