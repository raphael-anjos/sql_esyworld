select cod_produto, desc_comercial, class_fiscal, situacao
from cd_produto
where cod_produto IN ("294345","294347","294349","294351","294353","294355","294357","294359");

select cod_produto, desc_comercial, class_fiscal, situacao
from cd_produto
where class_fiscal = "85234920" AND situacao = 1;

select *
from cd_produto
where class_fiscal = "85234920" AND situacao = 1;

##Altera a classificação Fiscal dos produtos de caixinha que estão ativos
update cd_produto
set class_fiscal = "85234920"
where cod_produto IN ("294345","294347","294349","294351","294353","294355","294357","294359");

##Altera a classificação Fiscal dos produtos de caixinha que estão ativos
update cd_produto_empresa
set class_fiscal = "85234920"
where cod_empresa = 1 AND cod_produto IN ("294345","294347","294349","294351","294353","294355","294357","294359");