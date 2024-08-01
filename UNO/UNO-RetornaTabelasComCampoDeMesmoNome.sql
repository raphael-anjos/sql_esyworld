set @banco = 'db_uc_esyworld';
set @coluna = 'preco_venda_original';
select table_schema as BancoDeDados,
			table_name as tabela,
			column_name as nomeColuna
			from information_schema.columns
			where table_schema = @banco
					and column_name = @coluna;
					
					
