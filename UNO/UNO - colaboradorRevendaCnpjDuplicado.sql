/*
Tabela sg_colaborador
cod_colaborador : código do colaborador
*/
select cod_colaborador, situacao
from sg_colaborador 
where cod_colaborador = 4333
##situação
## inativo : 0
## ativo: 1
##########################################

SELECT cnpj,count(*)
FROM sg_colaborador
WHERE cnpj <> ''
GROUP BY cnpj
HAVING COUNT(*) > 1

SELECT sg_colaborador.cod_colaborador,sg_colaborador.nome_colaborador,
sg_colaborador.cnpj,sg_colaborador.situacao, sg_tp_colaborador.tp_colaborador
FROM sg_colaborador join sg_tp_colaborador
ON sg_colaborador.cod_colaborador = sg_tp_colaborador.cod_colaborador
WHERE sg_tp_colaborador.tp_colaborador = 4 AND  
sg_colaborador.cnpj IN (SELECT sg_colaborador.cnpj
						FROM sg_colaborador 
						WHERE sg_colaborador.cnpj <> '' GROUP BY sg_colaborador.cnpj
						HAVING COUNT(*) > 1)
						ORDER BY sg_colaborador.cnpj
						


select *
from sg_tp_colaborador
where cod_colaborador = 4333

## 2 vendedor
## 4 revenda
#########################################