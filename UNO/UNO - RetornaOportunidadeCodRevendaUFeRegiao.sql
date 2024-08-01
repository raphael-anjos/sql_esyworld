select op.cod_oportunidade, colab.cod_colaborador, colab.sigla_uf,
CASE
	WHEN colab.sigla_uf ='RO' THEN 'NORTE'
	WHEN colab.sigla_uf ='AC' THEN 'NORTE'
	WHEN colab.sigla_uf ='AM' THEN 'NORTE'
	WHEN colab.sigla_uf ='RR' THEN 'NORTE'
	WHEN colab.sigla_uf ='PA' THEN 'NORTE'
	WHEN colab.sigla_uf ='AP' THEN 'NORTE'
	WHEN colab.sigla_uf ='TO' THEN 'NORTE'
	WHEN colab.sigla_uf ='MA' THEN 'NORDESTE'
	WHEN colab.sigla_uf ='PI' THEN 'NORDESTE'
	WHEN colab.sigla_uf ='CE' THEN 'NORDESTE'
	WHEN colab.sigla_uf ='RN' THEN 'NORDESTE'
	WHEN colab.sigla_uf ='PB' THEN 'NORDESTE'
	WHEN colab.sigla_uf ='PE' THEN 'NORDESTE'
	WHEN colab.sigla_uf ='AL' THEN 'NORDESTE'
	WHEN colab.sigla_uf ='SE' THEN 'NORDESTE'
	WHEN colab.sigla_uf ='BA' THEN 'NORDESTE'
	WHEN colab.sigla_uf ='MG' THEN 'SUDESTE'
	WHEN colab.sigla_uf ='ES' THEN 'SUDESTE'
	WHEN colab.sigla_uf ='RJ' THEN 'SUDESTE'
	WHEN colab.sigla_uf ='SP' THEN 'SUDESTE'
	WHEN colab.sigla_uf ='PR' THEN 'SUL'
	WHEN colab.sigla_uf ='SC' THEN 'SUL'
	WHEN colab.sigla_uf ='RS' THEN 'SUL'
	WHEN colab.sigla_uf ='MS' THEN 'CENTRO OESTE'
	WHEN colab.sigla_uf ='MT' THEN 'CENTRO OESTE'
	WHEN colab.sigla_uf ='GO' THEN 'CENTRO OESTE'
	WHEN colab.sigla_uf ='DF' THEN 'CENTRO OESTE'
END
	AS 'Região'
from at_oportunidade as op join sg_colaborador as colab
on op.cod_revenda = colab.cod_colaborador
where op.cod_oportunidade between 40530 and 45223;




