/*Data 2016-04-26
Anotaçoes
4 - antendente vendedor >> 10 - Faturemnto revenda
6 - revenda >>>>>>>>>>>>>> 9 - Faturemento Cliente Final
1 - internet
2 - telemarketing
3 - distribuidor
5 - pda
7 - pdv
11 - indicação


Antes de 09/2015
Faturamento Cliente Final Pedido(71272)
origem: 6 - Revenda
cod_cliente = Codigo do cliente Final
cod_Revenda = Código da Revenda
Neste cenário os valores PreçoRevende <> PreçoVenda


Faturamento Revenda Pedido(71264)
origem: 4 - atendente vendedor
cod_cliente = Codigo do cliente Revenda
cod_Revenda = Vazio
Neste cenário os valores PreçoRevende == PreçoVenda
*/

/*Altera o codigo de origem de 4-atendente/vendedor para 10-Faturamento Revenda*/
UPDATE vd_pedido
SET origem = 10 
WHERE cod_empresa = 1 
	#AND dt_implant between '2014-01-01' AND '2015-09-01' 
	AND origem = 4;

/*Altera o codigo de origem de 6-Revenda para 9-Faturamento Cliente Final*/
UPDATE vd_pedido
SET origem = 9 
WHERE cod_empresa = 1 
	#AND dt_implant between '2014-01-01' AND '2015-09-01' 
	AND origem = 6;


/*Data: 2016-04-14
Tarefa: Sanitização de Tabela de Pedidos
Objetivo: Preencher os campos nome de Revenda no 
Relatório de Fup de Vendas do periodo anterior a 01/09/2015.
Descrição: Retorna pedidos com intervalo de data 01-01-2015 à 31-08-2015.
Quando a Empresa for 1, e o codigo da revenda estiver nulo e a 
origem for 4 - Atendente/Vendedor que era utilizado quando o faturamento era para REVENDA*/
SELECT cli.cod_cliente, ped.cod_cliente, ped.cod_pedido, ped.dt_implant, ped.cod_revenda
FROM cd_cliente as cli join vd_pedido as ped
ON cli.cod_cliente = ped.cod_cliente
WHERE ped.cod_empresa = 1 AND ped.cod_revenda IS NULL 
		AND ped.dt_implant between '2015-01-01' AND '2015-08-31' AND ped.origem = 4

/*Data: 2016-04-14
Tarefa: Sanitização de Tabela de Pedidos
Objetivo: Preencher os campos nome de Revenda no 
Relatório de Fup de Vendas do periodo anterior a 01/09/2015.
Descrição: Realiza o update da tabela de pedidos buscado o codigo de revenda no cadastro de clientes
quando o codigo de revenda gravado no pedido for nulo*/
UPDATE cd_cliente as cli join vd_pedido as ped
	ON cli.cod_cliente = ped.cod_cliente
   SET ped.cod_revenda = cli.cod_revenda_gerado
	WHERE ped.cod_empresa = 1 
		AND ped.cod_revenda IS NULL 
		AND ped.dt_implant between '2015-01-01' AND '2015-08-31' 
		AND ped.origem = 4;
		
	
/*Data: 2016-04-14
Tarefa: Sanitização de Tabela de Pedidos
Objetivo: Preencher os campos nome de Revenda no 
Relatório de Fup de Vendas do periodo anterior a 01/09/2015.
Descrição: Retorna clientes cadastrados sem codigo de revenda gerado porém que constam no cadastro
de revendas. Utilizando o atributo cnpj para reelacionamento.*/
SELECT cli.cod_cliente, cli.cnpj, colab.cnpj, colab.cod_colaborador
FROM cd_cliente AS cli join sg_colaborador AS colab
ON cli.cnpj = colab.cnpj
WHERE cli.cod_cliente IN (SELECT cli.cod_cliente
									FROM cd_cliente as cli join vd_pedido as ped
									ON cli.cod_cliente = ped.cod_cliente
									WHERE ped.cod_empresa = 1 
									AND ped.cod_revenda IS NULL 
									AND ped.dt_implant between '2015-01-01' 
									AND '2015-08-31' 
									AND ped.origem = 4
									);

/*Data: 2016-04-14
Tarefa: Sanitização de Tabela de Pedidos
Objetivo: Preencher os campos nome de Revenda no 
Relatório de Fup de Vendas do periodo anterior a 01/09/2015.
Descrição: Retorna o codigo de clinte e codigo de revenda garedo para o mesmo com 
relação de código obtidos da subquery*/
SELECT cod_cliente, cod_revenda_gerado
FROM cd_cliente
WHERE	cod_cliente IN (SELECT cli.cod_cliente
									FROM cd_cliente as cli join vd_pedido as ped
									ON cli.cod_cliente = ped.cod_cliente
									WHERE ped.cod_empresa = 1 
									AND ped.cod_revenda IS NULL 
									AND ped.dt_implant between '2015-01-01' 
									AND '2015-08-31' 
									AND ped.origem = 4
									);	
/*Data: 2016-04-14
Tarefa: Sanitização de Tabela de Pedidos
Objetivo: Preencher os campos nome de Revenda no 
Relatório de Fup de Vendas do periodo anterior a 01/09/2015.
Descrição: Atualiza no cadastro de cliente o atributo de código de Revenda Gerado, com codigo de 
colaborador do cadastro de colaboradores, utilizando o CNPJ para realização do relacionamento 
entre as entidades para relação de código de clientes passado no IN e desde que o codigo de 
revenda gerado seja nulo*/									
UPDATE cd_cliente AS cli JOIN sg_colaborador AS colab
	ON cli.cnpj = colab.cnpj
   SET cli.cod_revenda_gerado = colab.cod_colaborador
   WHERE cli.cod_revenda_gerado IS NULL 
		AND cli.cod_cliente IN (33118,47118,36040,70230,38626,95668,119584,
										36070,14457,25288,13532,51199,115867,30466,115867,
										95668,119584,25288);
										
										
/*INSERINDO CODIGO REVENDA ESY PARA REGISTROS QUE FICARAM SEM REVENDA*/
		
UPDATE vd_pedido
SET cod_revenda = 1944
WHERE cod_empresa = 1 
		AND cod_revenda IS NULL 
		AND dt_implant between '2014-01-01' AND '2014-12-31' 
		AND origem = 4;
		
UPDATE vd_pedido
SET cod_revenda = 1944
WHERE cod_empresa = 1 
		AND cod_revenda IS NULL 
		AND dt_implant between '2015-01-01' AND '2015-08-31' 
		AND origem = 4;

#######################################################
####################OUTROS#############################
#######################################################
SELECT DISTINCT(cli.cod_cliente)
FROM cd_cliente as cli join vd_pedido as ped
ON cli.cod_cliente = ped.cod_cliente
WHERE ped.cod_empresa = 1 AND ped.cod_revenda IS NULL 
		AND ped.dt_implant between '2015-01-01' AND '2015-08-31' AND ped.origem = 4;
		
		
		
SELECT cli.cod_cliente, cli.cod_revenda_gerado, cli.cnpj, colab.cnpj, colab.cod_colaborador
FROM cd_cliente AS cli JOIN sg_colaborador AS colab
ON cli.cnpj = colab.cnpj
WHERE cli.cod_cliente IN (83269,98801,103522,100149,12705,95906,100040,100696,95962,98354,118676,118695,75838,70032,
70033,97916,100689,96146,113522,48768,118776,113525,118803,118945,98777,50974,70034,70239,
70299,97915,10574,115759,115632,105746,115837,119381,119367,50231,115867,119525,98862,95668,
119584,96149,119640,119651,95642,34284,119713,119718,34645,105711,116103,116338,95394,119988,
119989,14344,100297,25288,97774,116995,94967,107736,117458)

SELECT cod_cliente, nome_cliente , cnpj
FROM cd_cliente
WHERE cod_cliente IN (83269,98801,103522,100149,12705,95906,100040,100696,95962,98354,118676,118695,75838,70032,
70033,97916,100689,96146,113522,48768,118776,113525,118803,118945,98777,50974,70034,70239,
70299,97915,10574,115759,115632,105746,115837,119381,119367,50231,115867,119525,98862,95668,
119584,96149,119640,119651,95642,34284,119713,119718,34645,105711,116103,116338,95394,119988,
119989,14344,100297,25288,97774,116995,94967,107736,117458)
							
SELECT cli.cod_cliente, cli.cod_revenda_gerado, cli.cnpj, colab.cnpj, colab.cod_colaborador
FROM cd_cliente AS cli, sg_colaborador AS colab
WHERE cli.cnpj = colab.cnpj and cli.cod_cliente = 98801

SELECT cod_cliente, cnpj
FROM cd_cliente
WHERE cod_cliente = 98801;

SELECT colab.cod_colaborador, colab.nome_colaborador
FROM sg_colaborador as colab
WHERE colab.cnpj = '03590418001409';

SELECT SELECT colab.cod_colaborador, colab.nome_colaborador
FROM sg_colaborador as colab
WHERE colab.cod_colaborador = ;


									
select * 
from vd_pedido
where cod_pedido = 68592;

SELECT cli.cod_cliente, ped.cod_cliente, ped.cod_pedido, ped.dt_implant, ped.cod_revenda, ped.origem
FROM cd_cliente as cli join vd_pedido as ped
ON cli.cod_cliente = ped.cod_cliente
WHERE ped.cod_empresa = 1 
		AND ped.cod_revenda = 0 
		AND ped.dt_implant between '2015-01-01' AND '2015-08-31' 
		AND ped.origem = 4;
		
