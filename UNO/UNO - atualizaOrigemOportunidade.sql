/*Atualizando cod_origem das oportunidades de acordo com mês e ano da 
mesma no deadline*/

set @mes = 3;
set @ano = 2016;
set @origem = @ano+@mes;
set @coringa = '%LIC.ANT%' ;
update at_oportunidade
set cod_origem = @origem
where month(dt_deadline) = @mes and year(dt_deadline) = @ano
		and descricao like @coringa;
		
