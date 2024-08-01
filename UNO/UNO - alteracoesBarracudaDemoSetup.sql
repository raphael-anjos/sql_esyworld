SELECT * FROM cd_produto
WHERE desc_comercial like 'barracuda%demo%Setup%'

UPDATE cd_produto
SET cod_tributacao_iss  = '2',
cod_tributacao_ipi = '2',
aliquota_ipi = 0,1500000,
aliquota_iss = 0,0200,
ind_ipi_diferenciado = '0x31',
tp_calculo_ipi = 1
WHERE desc_comercial like 'barracuda%demo%Setup%' 



UPDATE cd_produto
SET cod_tributacao_iss  = '2',cod_tributacao_ipi = '2',aliquota_ipi = 0.1500000,aliquota_iss = 0.0200,
ind_ipi_diferenciado = 0x31,tp_calculo_ipi = 1
WHERE desc_comercial like 'barracuda%demo%Setup%' 

UPDATE cd_produto
SET observacao = 'Hardware', cod_colaborador = 
WHERE desc_comercial like 'barracuda%demo%Setup%'

UPDATE cd_produto
SET cod_produto_fornec = cod_produto, cod_familia_comercial = 17
WHERE desc_comercial like 'barracuda%demo%Setup%'

UPDATE cd_produto
SET un = 'UN', desc_comercial_fornec = desc_comercial, desc_tecnica = desc_comercial, desc_nota_fiscal = desc_comercial
WHERE desc_comercial like 'barracuda%demo%Setup%'

UPDATE cd_produto
SET cod_fornecedor = 1853, moeda_compra = 'US$', perc_margem_lucro = 0, 
digitos_nr_serie = 2, ind_materia_prima = '0x30', fator_interacao = 0, dias_garantia_produto = 0
WHERE desc_comercial like 'barracuda%demo%Setup%'

Select *
from cd_produto
WHERE desc_comercial like 'barracuda%demo%Setup%' 