/*Data: 20/09/2017 
Solicitação de Bruna Carvalho Retornar todos os produtos e serviços com código RPS
Especificos 
*/
SELECT cod_produto,desc_comercial, class_fiscal, cod_produto_rps, 
case situacao 
when 0 then 'INATIVO'
when 1 then 'ATIVO'
end
FROM cd_produto
WHERE cod_produto_rps IN ('02879','02917','05762');






