/*Retorna regras de retenção de imposto no pagamento de comissão das revendas*/
SELECT cd_classificacao_fiscal.class_fiscal, cd_classificacao_fiscal.desc_abrev,cd_classificacao_fiscal.descricao,
cd_imposto_comissao_regra.cod_regra_imposto_comissao, cd_imposto_comissao_regra.desc_abrev,
cd_imposto_comissao_regra_item.cod_regra_imposto_comissao -- , cd_imposto_comissao_regra_item.class_fiscal, cd_imposto_comissao_regra_item.sigla_uf
FROM cd_classificacao_fiscal LEFT JOIN cd_imposto_comissao_regra_item
ON cd_classificacao_fiscal.class_fiscal = cd_imposto_comissao_regra_item.class_fiscal
LEFT JOIN cd_imposto_comissao_regra
ON cd_imposto_comissao_regra_item.cod_regra_imposto_comissao = cd_imposto_comissao_regra.cod_regra_imposto_comissao
WHERE cd_imposto_comissao_regra.cod_regra_imposto_comissao = 5
GROUP BY 1,2,3,4,5,6

/*Retorna relação de calssificações fiscla vinculadas a produtos da SonicWall que supostamente são HardWare*/

SELECT cd_produto.class_fiscal, cd_classificacao_fiscal.desc_abrev, cd_classificacao_fiscal.descricao
FROM cd_produto LEFT JOIN cd_classificacao_fiscal
ON cd_produto.class_fiscal = cd_classificacao_fiscal.class_fiscal
WHERE cd_produto.cod_produto IN ('02-SSC-2853','02-SSC-5637','02-SSC-5638','02-SSC-5639')
GROUP BY 1,2,3;
