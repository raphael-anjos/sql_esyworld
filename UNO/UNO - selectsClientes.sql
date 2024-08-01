SELECT cli.cod_cliente, cli.cnpj, cli.nome_cliente, cli.razao_social, cont.cod_contato, cont.nome_contato, cont.cargo
FROM cd_cliente as cli JOIN cd_cliente_contato cont
ON cli.cod_cliente = cont.cod_cliente
WHERE cont.cargo like 'vend%'

select cod_cliente, razao_social , nome_cliente ,cnpj
from cd_cliente

Select distinct (cargo) as cargo,cod_cliente, cod_contato, nome_contato
from cd_cliente_contato
where cargo like 'vend%'

/*Retorna codigo do cliente codigo do contato, DDD e telefone*/
select cct.cod_cliente,cct.cod_contato, ct.cod_telefone, ct.ddd, ct.telefone
from cd_cliente_contato_telefone as cct join cd_cliente_telefone as ct
on cct.cod_cliente = ct.cod_cliente and cct.cod_telefone = ct.cod_telefone
order by 1

##Retorna razao social, e situação do cliente
SELECT razao_social, situacao
FROM cd_cliente
WHERE cod_cliente IN ('41','1');

###Retorna o cadastro completo da Revenda e os contatos da mesma dentro de uma relação de códigos de clientes.
SELECT  cli.cod_cliente,cli.razao_social,cli.nome_cliente, cliend.endereco, cliend.numero, cliend.complemento_end,
cliend.bairro, cliend.cidade, cliend.cep, cliend.sigla_uf,cont.nome_contato, cont.email, "Silver" Nivel
FROM cd_cliente AS cli  JOIN cd_cliente_endereco AS cliend
ON cli.cod_cliente = cliend.cod_cliente
join cd_cliente_contato as cont
ON cliend.cod_cliente = cont.cod_cliente
WHERE (cont.email <> null OR cont.email <> ' ') 

##Retorna codigo do cliente revenda, razao social do ciente revenda, codido dos contatos da revenda, email dos contatos da revenda
##desde que o codigo da situacao seja 1, e o email não seja null ou vazio
SELECT cli.cod_cliente,cli.razao_social,cli.nome_cliente,cont.nome_contato, cont.email, "Platinum" Nivel
FROM cd_cliente AS cli JOIN cd_cliente_contato AS cont
ON cli.cod_cliente = cont.cod_cliente
WHERE (cont.email <> null OR cont.email <> ' ') 

##Retorna todos os dados da tabela cd_cliente (Cadastro de clientes)
SELECT * 
FROM cd_cliente;

##Retorna a quantidade de registros existentes no cadastro de clientes
SELECT count(cod_cliente) 
FROM cd_cliente;

##Retorna codigo do cliente revenda e e-mail dos contatos cadastrados para a Revenda
SELECT cliente.cod_cliente, contato.email
FROM cd_cliente AS cliente JOIN cd_cliente_contato AS contato
WHERE contato.cod_cliente = '7';

##Retorna em MAIUSCULO o nome dos clientes do cadastro de clientes quando o nome do cliente não for null ou vazio
SELECT UCASE(nome_cliente) 
FROM cd_cliente
WHERE nome_cliente <> null OR nome_cliente <> ' '

##Retorna o nome do cliente e razao social dos clientes cadastrados
SELECT nome_cliente, razao_social 
FROM cd_cliente

##Retorna todos os registros da tabela de contatos dos clientes por um cliente especifico
SELECT * 
FROM cd_cliente_contato
WHERE cod_contato = '10516';

##Retorna o e-mail dos contatos dos cliente com codigo 1, com status 1-ativo e com e-mail não vazios
SELECT cli.cod_cliente,cli.razao_social, cli.tb_preco, cli.tp_contribuinte, cont.cod_contato, cont.nome_contato, cont.email
FROM cd_cliente AS cli JOIN cd_cliente_contato AS cont
ON cli.cod_cliente = cont.cod_cliente
WHERE cli.situacao = 1  AND ind_promocao = 0x31 AND tb_preco = 'Revenda' AND cont.email <> ' ';

##Retorna o e-mail de todos os contatos dos cliente , com status 1-ativo e com e-mail não vazios, dentro de de um range de contratos de revenda
SELECT cli.cod_cliente,cli.razao_social, cli.tb_preco, cli.tp_contribuinte, cont.cod_contato, cont.nome_contato, cont.email
FROM cd_cliente AS cli JOIN cd_cliente_contato AS cont
ON cli.cod_cliente = cont.cod_cliente
WHERE cli.situacao = 1  AND tb_preco = 'Revenda' 
AND cont.email <> ' ' AND cli.cod_cliente IN (110241,117207,104245,96708);

##Retorna o codigo do cliente e a situação do cliente por cliente especifico.
SELECT cod_cliente, situacao
FROM cd_cliente
WHERE cod_cliente = 22761

##Retorna codigo do cliente, codigo da campanha, codigo da regiao, codigo do grupo, nome do cliente, 
##razao socila do cliente, tabela de preço, site, email de cobrança e email de nfe do cadastro de cliente Revenda.
SELECT  cod_cliente, cod_campanha,cod_regiao,
cod_grupo_cliente,nome_cliente,razao_social,
tb_preco,site,email_cobranca,email_nfe
FROM cd_cliente;

##Atualiza o nome do cliente para o mesmo dado informado em razao social se o mesmo for null ou vazio
UPDATE cd_clientes 
SET nome_cliente = razao_social
WHERE nome_cliente = null OR nome_cliente = ' ';

##Atualiza o razao social para o mesmo dado informado em nome do cliente se o mesmo for null ou vazio
UPDATE cd_clientes 
SET razao_social = nome_cliente 
WHERE razao_social = null OR razao_social = ' ';

##Seleciona [Código do cliente, Fantasia, RazaoSocial, Cnpj] dos clientes relacionados a determinado vendedor.
SELECT COD_CLIENTE, NOME_CLIENTE, RAZAO_SOCIAL,CNPJ
FROM  cd_cliente
WHERE cod_colaborador = 4678 

####Seleciona [Código do cliente, Fantasia, RazaoSocial, Cnpj] dos clientes relacionados a determinado vendedor que não esteja relacionado na lista IN.
SELECT COD_CLIENTE, NOME_CLIENTE, RAZAO_SOCIAL,CNPJ
FROM  cd_cliente
WHERE cod_colaborador = 4690 AND cod_cliente  NOT IN(117161,38622,107799,24451,81526)