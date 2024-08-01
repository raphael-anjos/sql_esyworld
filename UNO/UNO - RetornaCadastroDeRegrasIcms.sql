/*Data 2018-04-05
Objetivo: Obter todas as Regras de Icms cadastradas para a Empresa Esyworld
*/
SELECT it.cod_regra_icms as 'Codigo Regra', 
		 ic.desc_abrev as 'Regra', 
	CASE
       WHEN it.cod_origem_fiscal = 1 THEN "Origem Empresa Esyworld"
	    WHEN it.cod_origem_fiscal = 2 THEN "Origem Empresa Esyworld"
   	 END as 'Origem',
   CASE
		 WHEN it.tp_contribuinte = 1 THEN "Ativo Contribuinte"
	    WHEN it.tp_contribuinte = 2 THEN "Revenda"
  	    WHEN it.tp_contribuinte = 3 THEN "Ativo Nâo Contribuinte"
   	 END as 'Tipo De Contribuinte',
		 it.sigla_uf as 'UF', 
		 it.perc_base_icms *100 as 'Base ICMS',
		 it.aliquota_icms_propria *100 as 'Aliquota ICMS',
		 it.aliquota_icms_st *100 as 'Aliquota Interna',
		 it.perc_base_st *100 as 'Base ICMS ST',
		 it.perc_iva_st *100 as 'Indice ST',
		 it.perc_diferimento *100 as 'Aliquota Diferimento',
		 it.perc_base_icms_dest *100 as 'Base Dest',
		 it.aliquota_fcp *100 as 'Aliquota FCP',
		 it.ct as 'CT ICMS',
		 it.csosn as 'CSOSN'		 
from cd_icms_regra  as ic join cd_icms_regra_item as it
on ic.cod_regra_icms = it.cod_regra_icms
where it.cod_origem_fiscal = 1;
		
		
	
/*select * from cd_icms_regra_item as it
where it.cod_origem_fiscal = 1 and 
		it.cod_regra_icms = 4 and 
		it.sigla_uf = 'AP' and 
		it.tp_contribuinte = 2;
*/