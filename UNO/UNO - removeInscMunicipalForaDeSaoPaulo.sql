/* Data: 2018/01/11
Objetivo: Deixar em branco a INSCRIÇÃO MUNICIPAL de todos do clientes de 
fora do municipio de São Paulo.
Esta medida foi necessária devido a implantação do E-notas, que realiza o 
da inscrição municipal mesmo quando o tomador é de fora do municipio de 
domicilio do emissor.
*/

#inicia a Transação
start transaction;

#Retorna os clientes de cidade diferente de são paulo.
select cli.cod_cliente , cli.nome_cliente, cli.insc_municipal,
cliend.cidade
from cd_cliente as cli join cd_cliente_endereco as cliend
on cli.cod_cliente = cliend.cod_cliente
where cliend.cidade not in ('sao paulo','saopaulo','são paulo','sãopaulo')
and cli.insc_municipal is not null and cli.insc_municipal != ' ';

#Atualiza a insc municipal para vazio dos clientes de cidade diferente de sao paulo
update cd_cliente as cli join cd_cliente_endereco as cliend
on cli.cod_cliente = cliend.cod_cliente
SET cli.insc_municipal = ''
where cliend.cidade not in ('sao paulo','saopaulo','são paulo','sãopaulo')
and cli.insc_municipal is not null and cli.insc_municipal != ' ';

#Esta query não deve retornar nada.
select cli.cod_cliente , cli.nome_cliente, cli.insc_municipal,
cliend.cidade
from cd_cliente as cli join cd_cliente_endereco as cliend
on cli.cod_cliente = cliend.cod_cliente
where cliend.cidade not in ('sao paulo','saopaulo','são paulo','sãopaulo')
and cli.insc_municipal is not null and cli.insc_municipal != ' ';

#Aborta a Transação
rollback;
#Confirma a Transação Escreve no Banco.
commit;
