select *
from cd_grupo_item
where substring(cod_produto,9,1) IN ('A','B','C','D','E','K','M','N','P','Q','R','S','T')
AND cod_produto like ('kl%');

insert into cd_grupo_item (cod_produto, cod_grupo_produto)
select cod_produto, 5375 as cod_grupo_produto
from cd_produto
where substring(cod_produto,9,1) IN ('A','B','C','D','E','K','M','N','P','Q','R','S','T')
AND cod_produto like ('kl%');

insert into cd_grupo_item (cod_produto, cod_grupo_produto)
select cod_produto, 5368 as cod_grupo_produto
from cd_produto
where substring(cod_produto,9,1) IN ('U')
AND cod_produto like ('kl%');

insert into cd_grupo_item (cod_produto, cod_grupo_produto)
select cod_produto, 5376 as cod_grupo_produto
from cd_produto
where substring(cod_produto,9,1) IN ('V','W')
AND cod_produto like ('kl%');

insert into cd_grupo_item (cod_produto, cod_grupo_produto)
select cod_produto, 5377 as cod_grupo_produto
from cd_produto
where substring(cod_produto,9,1) IN ('X','Y')
AND cod_produto like ('kl%');


-- delete from cd_grupo_item
-- where cod_grupo_produto in (5375,5368,5376,5377)

