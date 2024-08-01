SELECT revenda.codigo_cliente AS 'Código Cliente',
     revenda.cod_revenda AS 'Código Reveda' 
		 revenda.cnpj AS 'CNPJ', 
		 revenda.fantasia AS 'Fantasia',
		 revenda.contato AS 'Nome Contato',
		 revenda.email_contato AS 'E-mail Contato',
     revenda.telefone AS 'Telefone'
		 pedidonf.primeira_compra AS 'Primeira Compra',
		 pedidonf.ultima_compra AS 'Ultima Compra'
     pedidonf.total_nf AS 'Valor Total Nota Fiscal'
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
Where cliente.cod_revenda_gerado > 0 AND cliente.cod_colaborador IN (7525,4676)) AS revenda

LEFT JOIN

(SELECT  ped.cod_revenda AS cod_revenda, ped.cod_pedido, MAX(nf.dt_emissao) AS ultima_compra,nf.vl_total_nota_fiscal, MIN(nf.dt_emissao) AS primeira_compra, SUM(nf.vl_total_nota_fiscal) AS total_nf
FROM vd_pedido AS ped LEFT JOIN vd_nota_fiscal AS nf
ON ped.cod_pedido = nf.cod_pedido
WHERE nf.situacao = 80 AND 
ped.cod_revenda IN (SELECT cod_revenda_gerado 
							FROM cd_cliente
							WHERE cod_revenda_gerado > 0 AND 
							cod_colaborador IN(7525, 4676))
GROUP BY ped.cod_revenda
ORDER BY ped.cod_revenda) AS pedidonf

ON revenda.cod_revenda = pedidonf.cod_revenda
