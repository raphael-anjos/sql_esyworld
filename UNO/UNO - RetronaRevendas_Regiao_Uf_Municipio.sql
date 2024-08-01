/*Data: 2020-05-28
Retorna Revendas e Vendedores com status da Revenda
UF da Revenda, Região, e municipio.
*/
SELECT cli.cod_cliente AS 'Código Cliente', 
cli.cod_revenda_gerado AS 'Código Revenda',
cli.nome_cliente AS'Fantasia', 
cli.razao_social AS 'Razão Social',
CASE cli.situacao 
WHEN 0 THEN 'INATIVO'
WHEN 1 THEN 'ATIVO'
WHEN 2 THEN 'SUSPECT'
WHEN 3 THEN 'PROSPECT'
WHEN 9 THEN 'BLOQUEADO'
WHEN 10 THEN 'CANCELADO'
ELSE 'INVALIDO' END AS 'Situação',
cliend.sigla_uf AS 'UF',
cliend.cidade AS 'Municipio',
reg.desc_abrev AS 'Região',

cli.cod_colaborador AS 'Código Vendedor', 
colab.nome_colaborador AS 'Nome Vendedor'
FROM 
cd_cliente_endereco AS cliend LEFT JOIN cd_cliente AS cli
ON cliend.cod_cliente = cli.cod_cliente
JOIN sg_colaborador AS colab
ON cli.cod_colaborador = colab.cod_colaborador
LEFT JOIN cd_regiao AS reg
ON cli.cod_regiao = reg.cod_regiao

WHERE (cli.cod_revenda_gerado IS NOT NULL and cli.cod_revenda_gerado <> 0)AND 
cliend.tp_endereco = 'E' AND cli.cod_colaborador NOT IN (6429,6783,6653,6797,4312);

