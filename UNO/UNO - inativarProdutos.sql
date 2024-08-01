/*Data: 25/08/2017
Objetivo: Inativar algusn serviços cadastrados no Sistema
(Quando Realizamos a inativação do produto através do sistema é alterado na tabela
cd_produto_empresa a situacao para 0 e remove o mesmo da tabela cd_preco_item)
Inativa o produto no Cadastro de produto por empresa esta á a tabela que refelte a situação no Cadastro do produto*/
START TRANSACTION;
UPDATE cd_produto_empresa
SET situacao = 0
WHERE cod_produto IN ('KL4703KAWFS','KL4703KAWTS','KL4703KAWTR','KL4703KAXFS','KL4703KAXTS','KL4703KAXTR');
COMMIT;

/*Remove os itens abaixo das Listas de Preço*/
START TRANSACTION;
DELETE FROM cd_preco_item
WHERE cod_produto IN ('KL4703KAWFS','KL4703KAWTS','KL4703KAWTR','KL4703KAXFS','KL4703KAXTS','KL4703KAXTR');
COMMIT;




