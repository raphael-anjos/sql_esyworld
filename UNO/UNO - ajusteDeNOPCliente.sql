SELECT cd_cliente.cod_cliente
		,cd_cliente.nome_cliente
		,cd_cliente.nop
		,cd_cliente.nop_servicos
FROM cd_cliente join cd_cliente_endereco
ON cd_cliente.cod_cliente = cd_cliente_endereco.cod_cliente
WHERE cd_cliente_endereco.sigla_uf = 'SP';

SELECT cd_cliente.cod_cliente
		,cd_cliente.nome_cliente
		,cd_cliente.nop
		,cd_cliente.nop_servicos
FROM cd_cliente join cd_cliente_endereco
ON cd_cliente.cod_cliente = cd_cliente_endereco.cod_cliente
WHERE cd_cliente_endereco.sigla_uf != 'SP'

/*Altera NOP no cadastro de cliente para 5.933 dos clientes
de DENTRO do ESTADO.*/
/*
UPDATE cd_cliente join cd_cliente_endereco
		ON cd_cliente.cod_cliente = cd_cliente_endereco.cod_cliente
		SET cd_cliente.nop = '5.933'
		WHERE cd_cliente_endereco.sigla_uf = 'SP';*/

		
/*Altera NOP no cadastro de cliente para 6.933 dos clientes
de FORA do ESTADO.*//*
UPDATE cd_cliente join cd_cliente_endereco
		ON cd_cliente.cod_cliente = cd_cliente_endereco.cod_cliente
		SET cd_cliente.nop = '6.933'
		WHERE cd_cliente_endereco.sigla_uf != 'SP';*/


		
/*UPDATE at_oportunidade as op JOIN cd_cliente as cli 
   ON op.cod_cliente = cli.cod_cliente
   SET op.nop = cli.nop
   WHERE dt_abertura >= '2016-04-01';
*/

