##Executado em 23/03/2016

##01.Remover caracteres [-,./\] do campo Inscrição Estadual do cadastro de clientes.
select cod_cliente, insc_estadual, cnpj
from cd_cliente
where 	insc_estadual like '%-%' or
	insc_estadual like '%,%' or
	insc_estadual like '%.%' or
	insc_estadual like '%/%';

update cd_cliente
set insc_estadual = replace(insc_estadual,'-','');
update cd_cliente
set insc_estadual = replace(insc_estadual,',','');
update cd_cliente
set insc_estadual = replace(insc_estadual,'.','');
update cd_cliente
set insc_estadual = replace(insc_estadual,'/','');

##02.Remover caracteres [-,./\] do campo Telefone dos contatos de Clientes.
select cod_cliente, telefone
from cd_cliente_telefone as ctel
where 	telefone like '%-%' or
	telefone like '%,%' or
	telefone like '%.%' or
	telefone like '%/%';
	
update cd_cliente_telefone
set telefone = replace(telefone,'-','');
update cd_cliente_telefone
set telefone = replace(telefone,',','');
update cd_cliente_telefone
set telefone = replace(telefone,'.','');
update cd_cliente_telefone
set telefone = replace(telefone,'/','');

##Fim 23/03/2016


##03.Atualizar os dados Basico do cadastro de colaborador com base no cadastro de clientes,
##Utilizando os campos cod_revenda_gerado e cod_colaborador para relacionamento.


##04. Verifica a quantidade de digitos no campo insc_estadual do cadastro de cliente por Estado.
Entidades Envolvidas:
cd_cliente (cod_cliente)
cd_cliente_endereco(cod_cliente)

select cli.insc_estadual, clie.sigla_uf
from cd_cliente  as cli join cd_cliente_endereco as clie
on cli.cod_cliente = clien.cod_cliente


select cli.cod_cliente,cli.insc_estadual, clie.sigla_uf, length(cli.insc_estadual)
from cd_cliente  as cli join cd_cliente_endereco as clie
on cli.cod_cliente = clie.cod_cliente
WHERE cli.insc_estadual in ('ISENTO','ISENTA')
order by clie.sigla_uf ;

select clie.sigla_uf, length(cli.insc_estadual) as tamanho
from cd_cliente  as cli join cd_cliente_endereco as clie
on cli.cod_cliente = clie.cod_cliente
WHERE clie.sigla_uf != 'EX'
group by clie.sigla_uf;





update cd_cliente  as cli join cd_cliente_endereco as clie 
on cli.cod_cliente = clie.cod_cliente
set cli.insc_estadual = '0000000000000'
where clie.sigla_uf IN ('DF') AND cli.insc_estadual IN ('ISENTO','ISENTA'); 

UPDATE cd_cliente
set insc_estadual = replace(insc_estadual,'.','');

UPDATE cd_cliente set insc_estadual = trim(insc_estadual);

Inscrição estadual quantidade de digitos
AC : 13
AM : 09
AL : 09     
AP : 09
BA : 10
CE : 09
DF : 13
ES : 09
GO : 09
MA : 09
MS : 09
MT : 09
PA : 09
PB : 09
SC : 09
TO : 09
RR : 09
SP : 12
PE : 09
PI : 09
RN : 09
SE : 09
PR : 10
RS : 10
RJ : 08
RO : 14 


