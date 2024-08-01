/*select *
from cd_produto
where cod_produto = 23883;*/
/*
#Cria tabela auxiliar para relacionar cod_produto com validade em dias
create table cd_produto_validade(
cod_produto varchar(30),
validade_dias int default 0,
foreign key fk_cd_produto_validade_cd_produto (cod_produto) references cd_produto(cod_produto)
);

#Insere na tabela auxiliar de validade produto os codigos do produtos
#com UN=LC e que o código comece com KL
INSERT INTO cd_produto_validade (cod_produto)
SELECT cod_produto FROM cd_produto 
where un = 'lc' and cod_produto like 'kl%'

#Retorna todos os produtos cadastrados com Unidade:LC e inicio de codigo KL
SELECT cod_produto
from cd_produto
where un = 'lc' and cod_produto like 'kl%'
*/
#Reazlia o update informando os dias de validade com base no SKU do produto
# F = 1ano, D = 2Anos, T=3anos
/*
UPDATE cd_produto_validade
SET validade_dias = if(substring(cod_produto,10,1) = 'F',365,
	 					  if(substring(cod_produto,10,1) = 'D',730,
	 					  if(substring(cod_produto,10,1) = 'T',1095,0)))
	 
	 
select *
from cd_produto_validade
where validade_dias <= 0

select substring(cod_produto,10,1)
from cd_produto_validade
where cod_produto = 'KL1091KCADR'
*/

