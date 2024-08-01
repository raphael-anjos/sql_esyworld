/*Data: 20/09/2017
Cria uma nova lista de Preço utilizando uma lista Existente como Modelo.
*/
INSERT INTO cd_preco_item (qtd_min,tb_preco,cod_produto,preco_unit,dt_alteracao)
SELECT qtd_min,'CANALTECH',cod_produto,preco_unit,now()
FROM cd_preco_item
WHERE tb_preco = 'Varejo30'; 

