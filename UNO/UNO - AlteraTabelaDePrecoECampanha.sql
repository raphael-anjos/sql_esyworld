##ANOTAÇÕES
#cd_cliente:Cadastro de clientes
#cod_cliente:int:Codigo do cliente no UNO.
#tb_preco:varchar : Tabela De Preço Padrão do Cliente
#cod_revenda_gerado:int:Código de Revenda do cliente
#cod_campanha: int:Código de Campanha[1-GOLD, 2-SILVER, 3-REGISTRADA, 4-PLATINUM, 5-MEMBER, 6-ATIVAÇÃO]
#cod_colaborador_revenda:int:codigo de revenda padrão definida no cadastro do cliente
#cod_colaborador:int:Código do Vendedor padrão definido no cadastro do Cliente.

#cd_tb_preco:Cadastro de Tabela de Preços
#Tabelas de Preço Existentes:
#[AIM7, BARRACUDA, CLIENTEFINAL, GOLD, NS, PLATINUM, REGISTRADA, REVENDA, SILVER, SOLO]

##Organização de Tabela de Preços no cadastro de Clientes
#Altera para tabela de Preço "REVENDA" os clientes que antes estavam com as tabelas
##('TabPadrão','REVENDA7')
UPDATE cd_cliente
SET tb_preco = 'REVENDA'
WHERE tb_preco IN ('TabPadrão','REVENDA7')

#Altera para tabela de Preço "CLIENTEFINAL" os clientes que antes estavam com as tabelas
##('CLFINAL12','CLFINAL12NC','CLFINAL7NC')
UPDATE cd_cliente
SET tb_preco = 'CLIENTEFINAL'
WHERE tb_preco IN ('CLFINAL12','CLFINAL12NC','CLFINAL7NC');

##Altera tabale de preço padrão no cadastro do cliente e a campanha somente dos clientes informados.
##PLATINUM
update cd_cliente
set tb_preco = 'PLATINUM', cod_campanha = 4
where cod_cliente IN (22761,94094,5242);

##Altera tabale de preço padrão no cadastro do cliente e a campanha somente dos clientes informados.
##GOLD
update cd_cliente
set tb_preco = 'GOLD', cod_campanha = 1
where cod_cliente IN (18721,118976,11758,119050,98016,44025,43174,42555,25613,22673,18620,5489,119,
66,16,14);

##Altera tabale de preço padrão no cadastro do cliente e a campanha somente dos clientes informados.
##SILVER
update cd_cliente
set tb_preco = 'SILVER', cod_campanha = 2
where cod_cliente IN (44247,103487,98855,42873,101103,33009,112391,28858,97508,26320,99388,22899,93090,
2247,120571,121796,15816,117442,12292,99679,119739,117018,115574,115560,115537,113502,108554,102801,100059,
97375,96925,95694,94407,93991,93429,47966,47192,47008,43246,35968,34988,34881,30129,20263,9950,3955);


##Remove vendedor padrao de cadastro de clientes sem código de revendedor


##Padroniza Tabela de preço para clientes sem código de revendedor (CLIENTEFINAL)
update cd_cliente
set tb_preco = 'CLIENTEFINAL'
where cod_revenda_gerado = 0

##Remove campanha de cadastro de clientes sem código de revendedor
update cd_cliente
set cod_campanha = null
where cod_revenda_gerado = 0

