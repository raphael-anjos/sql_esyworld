-- EXPLAIN
SELECT op.cod_oportunidade AS 'Oportunidade', cli.cod_cliente AS 'Código', cli.nome_cliente AS 'Cliente', 
colab2.cod_colaborador AS 'Código', colab2.nome_colaborador AS 'Revenda',colab.nome_colaborador AS 'Vendedor', 
fcom.desc_abrev AS 'Familia Comercial',stat.desc_abrev AS 'Status', (stat.probabilidade*100) AS 'probabilidade',
op.obs_status AS 'Observação Status', DATE_FORMAT(op.dt_abertura, '%d/%m/%Y') AS 'Abertura', 
DATE_FORMAT(op.dt_deadline, '%d/%m/%Y') AS 'DeadLine', DATEDIFF(NOW(),op.dt_abertura) AS 'Dias Aberto',
hist.dt_referencia AS 'Registro', hist.descricao AS 'Histórico'
FROM cd_cliente AS cli
LEFT JOIN at_oportunidade AS op ON cli.cod_cliente = op.cod_cliente
LEFT JOIN sg_colaborador AS colab ON op.cod_colaborador = colab.cod_colaborador
LEFT JOIN sg_colaborador AS colab2 ON colab2.cod_colaborador = op.cod_revenda
LEFT JOIN cd_familia_comercial AS fcom ON fcom.cod_familia_comercial = op.cod_familia_comercial
LEFT JOIN at_status AS stat ON stat.cod_status = op.cod_status
LEFT JOIN at_historico AS hist ON hist.cod_oportunidade = op.cod_oportunidade
	
/*(SELECT at_historico.cod_oportunidade, at_historico.dt_referencia, at_historico.descricao
				FROM at_oportunidade LEFT JOIN at_historico 
				ON at_oportunidade.cod_oportunidade = at_historico.cod_oportunidade
				WHERE at_oportunidade.cod_status < 104
				ORDER BY 1 , 2 DESC
				) as hist
				on op.cod_oportunidade = hist.cod_oportunidade*/
WHERE op.cod_status < 104;

