/*Data: 2018-04-18
Objetivo: Alterar o IPI de INCIDE para Destaca dos produtos Hardware
*/
start transaction;
update cd_produto
set tp_calculo_ipi = 1, ind_ipi_diferenciado = 0, aliquota_ipi = 0.15 , tp_calculo_ipi = 1
where class_fiscal = '85176249';


select tp_calculo_ipi, ind_ipi_diferenciado, aliquota_ipi, tp_calculo_ipi
from cd_produto
where class_fiscal = '85176249';

commit;