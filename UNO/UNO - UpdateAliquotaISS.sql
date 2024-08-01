/*2798 – Licenciamento	2800	2,00%	 2,90%
  2879 – Assessoria	   2881	5,00%	 2,90%
  2917 - Suporte	      2919	3,00%	 2,90%
*/
update cd_produto
set aliquota_iss = 0.0290
where cod_produto_rps in ('02800','02881','02919');

select cod_produto, class_fiscal, cod_produto_rps, aliquota_iss
from cd_produto
where cod_produto_rps = '02800'
