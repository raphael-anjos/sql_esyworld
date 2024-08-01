##Atualiza o campo de RevendaPadrao com mesmo codigo do campo de codigo de revenda gerado.
##Quando o campo de RevendaPadrao é null e o CodigoDeRevendaGerado é Maior que ZERO pois ZERO é o DEFAULT do Campo
update cd_cliente
set cod_colaborador_revenda = cod_revenda_gerado
where cod_colaborador_revenda is null and cod_revenda_gerado > 0;