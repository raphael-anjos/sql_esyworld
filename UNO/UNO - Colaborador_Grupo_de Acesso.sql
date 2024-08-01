/*Data 2019-08-13
Objetivo: Retornar os colaboradores internos da Esyworld com relação dos grupos de acesso.
Realizar a revisão e reorganização de permissionamento de acesso no Sistema.
*/
SELECT colab.cod_colaborador, colab.nome_colaborador, grupo.cod_grupo, grupo.nome_grupo
FROM sg_colaborador  as colab JOIN sg_grupo_colaborador AS gcolab
ON colab.cod_colaborador = gcolab.cod_colaborador
JOIN sg_grupo AS grupo 
ON gcolab.cod_grupo = grupo.cod_grupo
WHERE colab.nome_colaborador LIKE '%esy%' AND colab.situacao = 1
ORDER BY 1;