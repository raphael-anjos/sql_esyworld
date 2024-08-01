UPDATE sg_colaborador JOIN cd_cliente
		ON sg_colaborador.cod_colaborador = cd_cliente.cod_revenda_gerado
		JOIN cd_cliente_endereco
		ON cd_cliente_endereco.cod_cliente = cd_cliente.cod_cliente
		SET sg_colaborador.nome_colaborador = cd_cliente.razao_social,
			sg_colaborador.cnpj = cd_cliente.cnpj,
			sg_colaborador.sigla_uf = cd_cliente_endereco.sigla_uf,
			sg_colaborador.cidade = cd_cliente_endereco.cidade,
			sg_colaborador.bairro = cd_cliente_endereco.bairro,
			sg_colaborador.endereco = cd_cliente_endereco.endereco,
			sg_colaborador.numero =	cd_cliente_endereco.numero,
			sg_colaborador.referencia_end = cd_cliente_endereco.referencia_end,
			sg_colaborador.cod_regiao =	cd_cliente.cod_regiao,
			sg_colaborador.tb_preco = cd_cliente.tb_preco,
			sg_colaborador.descricao = 'Dados Cadastrais atualizados Automaticamente.';

select tb_preco from cd_cliente
where cod_revenda_gerado > 0
group by tb_precoDATABASE