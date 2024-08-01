select bairro, length(bairro)
from cepbai
where length(bairro) > 30
ORDER BY 2;
##Abreviações da base de Dados de CEP
/*
UPDATE cepbai
SET bairro = REPLACE(bairro,'CONJUNTO','CONJ');
UPDATE cepbai
SET bairro = REPLACE(bairro,'DOUTOR','DR');
UPDATE cepbai
SET bairro = REPLACE(bairro,'SETOR','SET');
UPDATE cepbai
SET bairro = REPLACE(bairro,'CONJUNTO','CONJ');
UPDATE cepbai
SET bairro = REPLACE(bairro,'CIDADE','CID');
UPDATE cepbai
SET bairro = REPLACE(bairro,'DESENVOLVIMENTO','DESENV');
UPDATE cepbai
SET bairro = REPLACE(bairro,'RESIDENCIAL','RES');
UPDATE cepbai
SET bairro = REPLACE(bairro,'ADMINISTRATIVO','ADM');
UPDATE cepbai
SET bairro = REPLACE(bairro,'RECREATIVO','RECR');
UPDATE cepbai
SET bairro = REPLACE(bairro,'ECONOMICO','ECON');
UPDATE cepbai
SET bairro = REPLACE(bairro,'COMERCIAL','COM');
UPDATE cepbai
SET bairro = REPLACE(bairro,'HABITACIONAL','HAB');
UPDATE cepbai
SET bairro = REPLACE(bairro,'CONJUNTO','CONJ');
UPDATE cepbai
SET bairro = REPLACE(bairro,' (','-');
UPDATE cepbai
SET bairro = REPLACE(bairro,')','');
UPDATE cepbai
SET bairro = REPLACE(bairro,'PRESIDENTE','PRES');
UPDATE cepbai
SET bairro = REPLACE(bairro,'JUNIOR','JR');
UPDATE cepbai
SET bairro = REPLACE(bairro,'INDUSTRIAS','IND');
UPDATE cepbai
SET bairro = REPLACE(bairro,'HABITACOES','HAB');
UPDATE cepbai
SET bairro = REPLACE(bairro,'CONDOMINIO','COND');
UPDATE cepbai
SET bairro = REPLACE(bairro,'VILA','VL');
UPDATE cepbai
SET bairro = REPLACE(bairro,'SENHORA','SRA');
UPDATE cepbai
SET bairro = REPLACE(bairro,'DISTRITO','DIST');
UPDATE cepbai
SET bairro = REPLACE(bairro,'INDUSTRIAL','IND');
UPDATE cepbai
SET bairro = REPLACE(bairro,'BLOCOS','BL');
UPDATE cepbai
SET bairro = REPLACE(bairro,'NASCIMENTO','NASC');
UPDATE cepbai
SET bairro = REPLACE(bairro,'CHACARA','CHAC');
UPDATE cepbai
SET bairro = REPLACE(bairro,'SANTO','STO');
UPDATE cepbai
SET bairro = REPLACE(bairro,'NOSSA','NSA');
UPDATE cepbai
SET bairro = REPLACE(bairro,'RECREIO','RECR');
UPDATE cepbai
SET bairro = REPLACE(bairro,'PARQUE','PQ');
UPDATE cepbai
SET bairro = REPLACE(bairro,'SANTA','STA');
UPDATE cepbai
SET bairro = REPLACE(bairro,'FUNCIONARIOS','FUNC');
UPDATE cepbai
SET bairro = REPLACE(bairro,'SATELITE','SAT');
UPDATE cepbai
SET bairro = REPLACE(bairro,'PUBLICOS','PUBL');
UPDATE cepbai
SET bairro = REPLACE(bairro,'SAO PAULO','SP');
UPDATE cepbai
SET bairro = REPLACE(bairro,'-',' ');
UPDATE cepbai
SET bairro = REPLACE(bairro,'DISTRITO','DIST');
UPDATE cepbai
SET bairro = REPLACE(bairro,'UNIVERSITARIO','UNIVERSIT');
UPDATE cepbai
SET bairro = REPLACE(bairro,'VALE','VL');
UPDATE cepbai
SET bairro = REPLACE(bairro,'CASTANHEIRA','CAST');
UPDATE cepbai
SET bairro = REPLACE(bairro,'EMPRESARIAL','EMPR');
UPDATE cepbai
SET bairro = REPLACE(bairro,'INDUSTRIAL','IND');
UPDATE cepbai
SET bairro = REPLACE(bairro,'CHACARA','CHAC');
UPDATE cepbai
SET bairro = REPLACE(bairro,'ZONA','ZN');
UPDATE cepbai
SET bairro = REPLACE(bairro,'SAO','S');
UPDATE cepbai
SET bairro = REPLACE(bairro,'CAUCAIA','CAUC');
UPDATE cepbai
SET bairro = REPLACE(bairro,'JARDIM','JD');
UPDATE cepbai
SET bairro = REPLACE(bairro,'GENERAL','GEN');
UPDATE cepbai
SET bairro = REPLACE(bairro,'TECNOLOGICA','TEC');
UPDATE cepbai
SET bairro = REPLACE(bairro,'ENGENHEIRO','ENG');
UPDATE cepbai
SET bairro = REPLACE(bairro,'HISTORICA','HIST');
UPDATE cepbai
SET bairro = REPLACE(bairro,'DEPUTADO','DEP');
UPDATE cepbai
SET bairro = REPLACE(bairro,'FRANCISCO','FCO');
UPDATE cepbai
SET bairro = REPLACE(bairro,'PREFEITO','PREF');
UPDATE cepbai
SET bairro = REPLACE(bairro,'GOVERNADOR','GOV');
UPDATE cepbai
SET bairro = REPLACE(bairro,'SEBASTIAO','SEBAST');
UPDATE cepbai
SET bairro = REPLACE(bairro,'MESTRE','MSC');
UPDATE cepbai
SET bairro = REPLACE(bairro,'FASE II','')
WHERE length(bairro) > 30;
UPDATE cepbai
SET bairro = REPLACE(bairro,'VEREADOR','VER');
UPDATE cepbai
SET bairro = REPLACE(bairro,'CEOMERCIARIOS','COM');
UPDATE cepbai
SET bairro = REPLACE(bairro,'NOVA','NV');
UPDATE cepbai
SET bairro = REPLACE(bairro,'NOVO','NV');
UPDATE cepbai
SET bairro = REPLACE(bairro,'PROFESSORA','PROFA');
UPDATE cepbai
SET bairro = REPLACE(bairro,'PROFESSOR','PROF');
UPDATE cepbai
SET bairro = REPLACE(bairro,'DONA','D.');
UPDATE cepbai
SET bairro = REPLACE(bairro,'ESPECIALISTA','ESPEC');
UPDATE cepbai
SET bairro = REPLACE(bairro,'PRIMAVERA','PRIMAV');
UPDATE cepbai
SET bairro = REPLACE(bairro,'PROLONGAMENTO','PROLONG');
UPDATE cepbai
SET bairro = REPLACE(bairro,'ESTANCIA','EST');
UPDATE cepbai
SET bairro = REPLACE(bairro,'LOTEAMENTO','LOT');
UPDATE cepbai
SET bairro = REPLACE(bairro,'  ',' ');
UPDATE cepbai
SET bairro = REPLACE(bairro,'INTERNACIONAL','INTER');
UPDATE cepbai
SET bairro = REPLACE(bairro,'RECANTO','RECTO');
UPDATE cepbai
SET bairro = REPLACE(bairro,'INDEPENDENCIA','INDEPEND');
UPDATE cepbai
SET bairro = REPLACE(bairro,'NUCLEO','NUC');
UPDATE cepbai
SET bairro = REPLACE(bairro,'PROLONGAMENTO','PROLONG');
UPDATE cepbai
SET bairro = REPLACE(bairro,'ASSENTAMENTO','ASSENT');
UPDATE cepbai
SET bairro = REPLACE(bairro,'COLONIA','COL');
UPDATE cepbai
SET bairro = REPLACE(bairro,'POUSADA','PSDA');
UPDATE cepbai
SET bairro = REPLACE(bairro,'APARECIDA','AP');
UPDATE cepbai
SET bairro = REPLACE(bairro,'CONCEICAO','CONCEI');
UPDATE cepbai
SET bairro = REPLACE(bairro,'COMENDADOR','COMEND');
UPDATE cepbai
SET bairro = REPLACE(bairro,'AGUAS','AGUA');
UPDATE cepbai
SET bairro = REPLACE(bairro,'BANDEIRANTES','BAND');
UPDATE cepbai
SET bairro = REPLACE(bairro,'ESTRADA','ESTR');
UPDATE cepbai
SET bairro = REPLACE(bairro,'DESPORTIVO','DESPORT');
UPDATE cepbai
SET bairro = REPLACE(bairro,'CORONEL','CEL');
UPDATE cepbai
SET bairro = REPLACE(bairro,'EVANGELISTA','EVANG');
UPDATE cepbai
SET bairro = REPLACE(bairro,'FUNDACAO','FUND');
UPDATE cepbai
SET bairro = REPLACE(bairro,'EXPEDICOES','EXPED');
UPDATE cepbai
SET bairro = REPLACE(bairro,'EXPOSICOES','EXPO');
UPDATE cepbai
SET bairro = REPLACE(bairro,'TECNOLOGIA','TEC');
UPDATE cepbai
SET bairro = REPLACE(bairro,'CASTELO','CAST');
UPDATE cepbai
SET bairro = REPLACE(bairro,'ESPLANADA','ESPL');
UPDATE cepbai
SET bairro = REPLACE(bairro,'VICENTE','VIC');
UPDATE cepbai
SET bairro = REPLACE(bairro,'FAZENDA','FAZ');
UPDATE cepbai
SET bairro = REPLACE(bairro,'CAMPESTRE','CAMP');
UPDATE cepbai
SET bairro = REPLACE(bairro,'COMPLEMENTO','COMPL');
UPDATE cepbai
SET bairro = REPLACE(bairro,'BANDEIRANTE','BAND');
UPDATE cepbai
SET bairro = REPLACE(bairro,'VIRACOPOS GLEBA','VIRACOPOS');
UPDATE cepbai
SET bairro = REPLACE(bairro,'CLARAS','CLARA');
*/
UPDATE cepbai
SET bairro = REPLACE(bairro,'GRACA','GRCA');
UPDATE cepbai
SET bairro = REPLACE(bairro,'GRACAS','GRCA');
UPDATE cepbai
SET bairro = REPLACE(bairro,'VICENTE','VIC');

UPDATE cepbai
SET bairro = REPLACE(bairro,'VARZENA','VZA');