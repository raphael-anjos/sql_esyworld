/*Lista todas as tabelas que possuam o atributo com nome 
passado a variavel @coluna.
@banco = nome da Base de Dados
@coluna = nome da Caoluna procurada*/
SET @banco = 'db_uc_desenv'; 
SET @coluna = 'tb_preco';
SELECT table_schema AS BancoDeDados,
			table_name AS tabela,
			column_name AS nomeColuna
FROM information_schema.columns
WHERE table_schema = @banco AND column_name = @coluna;
					
					
