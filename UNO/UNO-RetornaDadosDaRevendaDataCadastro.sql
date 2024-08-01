/*Data: 2018-09-06
Objetivo: Retornar Dados das Revendas cadatrastras por intervalo de Data de 
Cadastro.
Campos Retornados(Codigo de Cliente, Codigo de Revenda, Razão Social, Cnpj,
Cidade, Estado, Lista de Preço, Data De Cadastro, Situação do Cadastro)
*/

set @dataInicial = '2000-01-01';
set @dataFinal = now();

select distinct (cli.cod_cliente) as 'Código de Cliente Uno',
		 cli.cod_revenda_gerado as 'Código Revenda Uno', 
		 cli.nome_cliente as 'Fantasia',
		 cli.razao_social as 'Razão Social', 
		 cli.cnpj as 'Cnpj',
		 ende.cidade as 'Cidade',
		 ende.sigla_uf as 'Estado',
		 cli.tb_preco as 'Lista' , 
		 cli.dt_implant as 'Data de Cadastro',
		CASE
			WHEN cli.situacao = 0 THEN 'Inativo'
			WHEN cli.situacao = 1 THEN 'Ativo'
			WHEN cli.situacao = 2 THEN 'Suspect'
			WHEN cli.situacao = 3 THEN 'Prospect'
			WHEN cli.situacao = 9 THEN 'Bloqueado'
			WHEN cli.situacao = 10 THEN 'Cancelado'
       	END
		 as 'Situação',
		 colab.cod_colaborador as 'Codigo Gerente',
		 colab.nome_colaborador as 'Nome Gerente'
from cd_cliente as cli inner join cd_cliente_endereco as ende
	on cli.cod_cliente = ende.cod_cliente
inner join sg_colaborador as colab 
	on cli.cod_colaborador = colab.cod_colaborador
where cli.cod_revenda_gerado > 0 
	and  cli.dt_implant between @dataInicial and @dataFinal;