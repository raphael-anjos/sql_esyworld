/*Objetivo: Realizar a alteração dos códigos RPS no cadastro dos produtos de acordo com solicitação realizarda vinda da 
contabilidade.
"Obs. O Motivo foi a atualização das aliquotas nos site da Prefeitura, a mesma não utilizou o mesmo código, 
mais criou um novo com a nova aliquota."

De: 02798 >> Para: 02800 
De: 02879 >> Para: 02881
De: 02917 >> Para: 02919*/

start transaction;
set @de = '02917';
set @para = '02919';

update cd_produto
set cod_produto_rps = @para
where cod_produto_rps = @de;

select *
from cd_produto
where cod_produto_rps = @de;

rollback;
commit;

