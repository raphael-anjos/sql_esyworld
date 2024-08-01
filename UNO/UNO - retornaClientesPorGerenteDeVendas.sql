/*Data: 2017/07/11
Objetivo: Obter a relação de todos os clientes que possuem código de Revenda Gerado
Por Gerente de Contas
*/

SELECT cd_cliente.cod_cliente AS 'Código Uno', cd_cliente.cod_revenda_gerado AS 'Código Revenda',
cd_cliente.cod_colaborador AS 'Matricula Gerente', sg_colaborador.nome_colaborador AS 'Nome Gerente'
FROM cd_cliente
JOIN sg_colaborador ON cd_cliente.cod_colaborador = sg_colaborador.cod_colaborador
WHERE cd_cliente.cod_colaborador = 3572 AND cd_cliente.cod_revenda_gerado IS NOT NULL;