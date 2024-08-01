set @banco = 'db_uc_desenv';
set @coluna = 'ip';
select table_schema as BancoDeDados,
			table_name as tabela,
			column_name as nomeColuna
			from information_schema.columns
			where table_schema = @banco
					and column_name = @coluna;
					
					
select *
from sg_colaborador_acesso
where cod_colaborador = 3127

select *
from sg_log