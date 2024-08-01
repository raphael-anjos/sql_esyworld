/*Data: 2022-01-27
Objetivo: Retorna produtos cadastrados utilizando familia comercial como filtro
*/

SELECT prod.cod_produto AS 'SKU', 
prod.desc_tecnica AS 'DESCRIÇÃO TÉCNICA', 
prod.cod_familia_comercial AS 'CÓDIGO FAMILIA COMERCIAL', 
fam.desc_abrev AS 'FAMILIA COMERCIAL', 
prod.class_fiscal AS 'NCM', 
CASE
	WHEN prod.ind_servico = 1 THEN 'LICENÇA'
	WHEN prod.ind_servico = 0 THEN 'HARDWARE'
	ELSE 'INVÁLIDO'
END AS 'TIPO',
prod.un AS 'UN',
CASE
	WHEN prod.situacao = 1 THEN 'Ativo'
	WHEN prod.situacao = 0 THEN 'Inativo'
	ELSE 'Inválido'
END AS 'SITUAÇÃO'
FROM cd_produto AS prod LEFT JOIN cd_familia_comercial AS fam
ON prod.cod_familia_comercial = fam.cod_familia_comercial
WHERE prod.cod_familia_comercial IN (36,37)


/*Data: 2022-02-22
Objetivo: Retorna produtos cadastrados por Fornecedor
*/
SELECT prod.cod_produto AS 'SKU', 
prod.desc_tecnica AS 'DESCRIÇÃO TÉCNICA', 
prod.cod_familia_comercial AS 'CÓDIGO FAMILIA COMERCIAL', 
fam.desc_abrev AS 'FAMILIA COMERCIAL', 
forn.cod_fornecedor AS 'COD FORNECEDOR',
forn.nome_fantasia  AS 'NOME FORNECEDOR',
prod.class_fiscal AS 'NCM', 
CASE
	WHEN prod.ind_servico = 1 THEN 'LICENÇA'
	WHEN prod.ind_servico = 0 THEN 'HARDWARE'
	ELSE 'INVÁLIDO'
END AS 'TIPO',
prod.un AS 'UN',
CASE
	WHEN prod.situacao = 1 THEN 'Ativo'
	WHEN prod.situacao = 0 THEN 'Inativo'
	ELSE 'Inválido'
END AS 'SITUAÇÃO'

FROM cd_produto AS prod LEFT JOIN cd_familia_comercial AS fam
ON prod.cod_familia_comercial = fam.cod_familia_comercial
LEFT JOIN cd_fornecedor AS forn
ON prod.cod_fornecedor = forn.cod_fornecedor

WHERE forn.cod_fornecedor IN (11331,11827)
