/*Remove espaços em branco a esquerda no cadastro de cliente
dos Campos razão Social e Nome Fantasia*/
update cd_cliente
set cd_cliente.razao_social = ltrim(cd_cliente.razao_social),
	cd_cliente.nome_cliente = ltrim(cd_cliente.nome_cliente);

/*Realiza a atualização no cadastro de Revendas com os dados básicos
Buscando estes no cadastro da Revenda como Cliente*/
set @dia = now();
set @obs = 'Dados Atualizados Automaticamente em:';
set @atributos = 'Nome - Cnpj - Endereço - Numero - Cidade - Bairro - Uf - Referencia Endereço - Região - tabela de Preço';
set @observacoes = concat(@obs,' ',@dia,' ','Atributos:',' ',@atributos,' Os atributos atualizados foram obtidos do cadastro de cliente');

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
			sg_colaborador.descricao = @observacoes


