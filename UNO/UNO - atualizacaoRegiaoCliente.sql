## Norte 1 - AM-RR-AP-PA-TO-RO-AC
##RETORNA CODIGO DE CLIENTE E SIGLA UP DO CLIENTE
select cliend.cod_cliente, cliend.sigla_uf
from cd_cliente as cli join cd_cliente_endereco as cliend
on cli.cod_cliente = cliend.cod_cliente
where cliend.sigla_uf in ('AM','RR','AP','PA','TO','RO','AC')

##ATUALIZA O CÓDIGO DE REGIÃO PARA 1 DOS CLIENTES POR UF.
UPDATE cd_cliente
SET cod_regiao = 1
WHERE cod_cliente IN (SELECT cod_cliente
FROM cd_cliente_endereco
WHERE sigla_uf IN ('AM','RR','AP','PA','TO','RO','AC'));


## Nordeste 2 - MA-PI-CE-RN-PE-PB-SE-AL-BA
##RETORNA CODIGO DE CLIENTE E SIGLA UP DO CLIENTE
select cliend.cod_cliente, cliend.sigla_uf
from cd_cliente as cli join cd_cliente_endereco as cliend
on cli.cod_cliente = cliend.cod_cliente
where cliend.sigla_uf in ('MA','PI','CE','RN','PE','PB','SE','AL','BA')

##ATUALIZA O CÓDIGO DE REGIÃO PARA 2 DOS CLIENTES POR UF.
UPDATE cd_cliente
SET cod_regiao = 2
WHERE cod_cliente IN (SELECT cod_cliente
FROM cd_cliente_endereco
WHERE sigla_uf IN ('MA','PI','CE','RN','PE','PB','SE','AL','BA'));

## Centro-Oestes 3 - MT-MS-GO
##RETORNA CODIGO DE CLIENTE E SIGLA UP DO CLIENTE
SELECT cli.cod_cliente, cliend.sigla_uf
FROM cd_cliente AS cli JOIN cd_cliente_endereco AS cliend
ON cli.cod_cliente = cliend.cod_cliente
WHERE cliend.sigla_uf IN ('MT','MS','GO')

##ATUALIZA O CÓDIGO DE REGIÃO PARA 3 DOS CLIENTES POR UF.
UPDATE cd_cliente
SET cod_regiao = 3
WHERE cod_cliente IN (SELECT cod_cliente
FROM cd_cliente_endereco
WHERE sigla_uf IN ('MT','MS','GO','DF'));


## Sudeste 4 - SP-RJ-ES-MG
##RETORNA CODIGO DE CLIENTE E SIGLA UP DO CLIENTE
select cliend.cod_cliente, cliend.sigla_uf
from cd_cliente as cli join cd_cliente_endereco as cliend
on cli.cod_cliente = cliend.cod_cliente
where cliend.sigla_uf in ('SP','RJ','ES','MG')

##ATUALIZA O CÓDIGO DE REGIÃO PARA 4 DOS CLIENTES POR UF.
UPDATE cd_cliente
SET cod_regiao = 4
WHERE cod_cliente IN (SELECT cod_cliente
FROM cd_cliente_endereco
WHERE sigla_uf IN ('SP','RJ','ES','MG'));

## Sul 5 - PR-RS-SC
##RETORNA CODIGO DE CLIENTE E SIGLA UP DO CLIENTE
select cliend.cod_cliente, cliend.sigla_uf
from cd_cliente as cli join cd_cliente_endereco as cliend
on cli.cod_cliente = cliend.cod_cliente
where cliend.sigla_uf in ('PR','RS','SC')

##ATUALIZA O CÓDIGO DE REGIÃO PARA 5 DOS CLIENTES POR UF.
UPDATE cd_cliente
SET cod_regiao = 5
WHERE cod_cliente IN (SELECT cod_cliente
FROM cd_cliente_endereco
WHERE sigla_uf IN ('PR','RS','SC'));

##ATUALIZANDO UF DO CLIENTE PARA EX, QUANDO O MESMO NÃO POSSUIR UM UF VALIDO.
UPDATE cd_cliente_endereco
SET sigla_uf = 'EX'
WHERE sigla_uf NOT IN ('PR','RS','SC','AM','RR','AP','PA','TO','RO','AC',
'MA','PI','CE','RN','PE','PB','SE','AL','BA','MT','MS','GO','DF','SP','RJ','ES',
'MG')


