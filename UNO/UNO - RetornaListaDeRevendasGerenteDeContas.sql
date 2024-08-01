SELECT cli.cod_cliente as 'codCliente', cli.cod_revenda_gerado as 'codRevenda',
cli.razao_social as 'razãoSocial', cli.tb_preco as 'Lista', cli.dt_implant as 'dataCadstro',
cli.cod_colaborador as 'codVendedor', colab.nome_colaborador as 'Vendedor'
FROM cd_cliente as cli join sg_colaborador as colab
ON cli.cod_colaborador = colab.cod_colaborador
WHERE cli.cod_revenda_gerado > 0;