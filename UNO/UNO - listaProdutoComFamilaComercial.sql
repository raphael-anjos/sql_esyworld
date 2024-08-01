/*Data: 2017/07/11
Objetivo: Listar todos os produtos/serviços cadastrados no sistema com a respectiva
familia comercial e situação do produto
*/
select prod.cod_produto as 'Código', prod.desc_comercial as 'Descrição', 
fam.desc_abrev as 'Familia Comercial', CASE prod.situacao
WHEN 0 THEN 'Inativo'
WHEN 1 THEN 'Ativo'
ELSE 'Desconhecido' END AS Situação
from cd_produto as prod join cd_familia_comercial as fam
on prod.cod_familia_comercial = fam.cod_familia_comercial
order by 3;
