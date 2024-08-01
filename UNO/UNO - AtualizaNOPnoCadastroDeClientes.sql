/*Data: 2018-04-19
Objetivo: Atualizar a NOP de PRODUTO e SERVIÇO no cadastro de cliente de acordo com as seguintes sitações:
Serviço: Dentro = '5.933' - Fora = '6.933'
Produto: Dentro = '5.102' - Fora = '6.102'
*/
/*Atualiza os clientes de Fora do Estado*/
start transaction;
update cd_cliente as clien join cd_cliente_endereco as cliend
on clien.cod_cliente = cliend.cod_cliente
set clien.nop_servicos ='6.933' , clien.nop = '6.102'
where cliend.sigla_uf <> 'SP';

select clien.cod_cliente, clien.nop, clien.nop_servicos
from cd_cliente as clien join cd_cliente_endereco as cliend
on clien.cod_cliente = cliend.cod_cliente
where cliend.sigla_uf <> 'SP';


/*Atualiza os clientes de Dentro do Estado*/
update cd_cliente as clien join cd_cliente_endereco as cliend
on clien.cod_cliente = cliend.cod_cliente
set clien.nop_servicos ='5.933' , clien.nop = '5.102'
where cliend.sigla_uf = 'SP';

select clien.cod_cliente, clien.nop, clien.nop_servicos
from cd_cliente as clien join cd_cliente_endereco as cliend
on clien.cod_cliente = cliend.cod_cliente
where cliend.sigla_uf = 'SP';

commit;
rollback;

tp_contribuinte
1 = Ativo Contribuinte
2 = Revenda
3 = Ativo Não Contribuinte





