##Retorna todos os colaboradores que possuem e-mail com dominio da [@esy.com.br] e que estão ativos.
SELECT *
FROM sg_grupo_colaborador
WHERE cod_colaborador IN 
(SELECT cod_colaborador
FROM sg_colaborador
WHERE email like "%@esy.com.br" and situacao = 1)
ORDER BY 2;

##Apaga todos os colaboradores que possuem e-mail com dominio da [@esy.com.br] e que estão ativos.
DELETE 
FROM sg_grupo_colaborador
WHERE cod_colaborador IN 
(SELECT cod_colaborador
FROM sg_colaborador
WHERE email like "%@esy.com.br" and situacao = 1)

##Insere grupo de Administrador para todos os colaboradores ativos e com e-mail no dominio [@esy.com.br]
INSERT INTO sg_grupo_colaborador (cod_grupo,cod_colaborador,cod_empresa)
SELECT (1) as grupo ,cod_colaborador, (1) as empresa
FROM sg_colaborador
WHERE email like "%@esy.com.br" and situacao = 1
