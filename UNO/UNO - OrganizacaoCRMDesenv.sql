##Retorna todas as oportunidades existentes no sistema
select * from at_oportunidade

##Retorna todos os Status de Oportunidade cadastrados no sistema
SELECT * FROM at_status

##Reazliação de Insert Declarativo na tabela de Status de Oportunidade
INSERT INTO at_status (cod_status,desc_abrev,ind_extranet,probabilidade)
VALUES (1,'PROSPECT',0,0.10)
INSERT INTO at_status (cod_status,desc_abrev,ind_extranet,probabilidade)
VALUES (2,'ANALISE DE CENARIO',0,0.20)
INSERT INTO at_status (cod_status,desc_abrev,ind_extranet,probabilidade)
VALUES (3,'PROVA DE CONCEITO',0,0.30)
INSERT INTO at_status (cod_status,desc_abrev,ind_extranet,probabilidade)
VALUES (4,'HOMOLOGACAO',0,0.40)
INSERT INTO at_status (cod_status,desc_abrev,ind_extranet,probabilidade)
VALUES (5,'ENVIO DE PROPOSTA',0,0.60)
INSERT INTO at_status (cod_status,desc_abrev,ind_extranet,probabilidade)
VALUES (6,'NEGOCIACAO',0,0.70)
INSERT INTO at_status (cod_status,desc_abrev,ind_extranet,probabilidade)
VALUES (7,'COMPRAS',0,0.90)
INSERT INTO at_status (cod_status,desc_abrev,ind_extranet,probabilidade)
VALUES (8,'PEDIDO',0,1.00)
INSERT INTO at_status (cod_status,desc_abrev,ind_extranet,probabilidade)
VALUES (9,'PERDIDO',0,0.0);

##Retorna o relacionamento entre colaborador e status de oportunidade
select * from at_status_colaborador

##Apaga todos os registros da tabela at_status_colaborador
delete from at_status_colaborador
##Apaga todos os regitros da tabela at_status
delete  from at_status

##Desabilita a checagem de integridade de chave estrangeira
SET foreign_key_checks = 0;
##Habilita a checagem de integridade de chave estrangeira
SET foreign_key_checks = 1;

##Apaga todas as oportunidades existentes no sistema
SET foreign_key_checks = 0;
delete 
from at_oportunidade
SET foreign_key_checks = 1;

##Apagar foreign key
ALTER TABLE <nome da tabela> DROP FOREIGN KEY <NOME DA RESTRIÇÃO>

##Retorna todos os concorrentes
SELECT * FROM at_concorrente

##Insere dados na tabela de Concorrentes, efetuado para implantação do CRM.
INSERT at_concorrente (cod_concorrente,nome_fantasia,situacao,pais)
VALUES (13,'FORTNET',1,'BRASIL')
INSERT at_concorrente (cod_concorrente,nome_fantasia,situacao,pais)
VALUES (14,'CHECK POINT',1,'BRASIL')
INSERT at_concorrente (cod_concorrente,nome_fantasia,situacao,pais)
VALUES (15,'JUNIPER',1,'BRASIL')
INSERT at_concorrente (cod_concorrente,nome_fantasia,situacao,pais)
VALUES (16,'SONIC WALL',1,'BRASIL')
INSERT at_concorrente (cod_concorrente,nome_fantasia,situacao,pais)
VALUES (17,'PALO ALTO',1,'BRASIL')
INSERT at_concorrente (cod_concorrente,nome_fantasia,situacao,pais)
VALUES (18,'CISCO',1,'BRASIL')
INSERT at_concorrente (cod_concorrente,nome_fantasia,situacao,pais)
VALUES (19,'WEB SENSE',1,'BRASIL')
INSERT at_concorrente (cod_concorrente,nome_fantasia,situacao,pais)
VALUES (20,'CYBEROAM',1,'BRASIL')
INSERT at_concorrente (cod_concorrente,nome_fantasia,situacao,pais)
VALUES (21,'BACKUP EXEC',1,'BRASIL')
INSERT at_concorrente (cod_concorrente,nome_fantasia,situacao,pais)
VALUES (22,'ARCSERVER',1,'BRASIL')
INSERT at_concorrente (cod_concorrente,nome_fantasia,situacao,pais)
VALUES (23,'OUTROS',1,'BRASIL')

##Retorna todas as barreiras cadastradas
SELECT * FROM at_barreira

##Altera da descrição da BARREIRAS para letras MAIUSCULA
UPDATE at_barreira
SET desc_abrev = UPPER(desc_abrev)

##Retorna todos os usuários que perencem ao grupo ADMINISTRADOR e não estão relacionados 
##no range de codigos informados
SELECT *
FROM sg_grupo_colaborador
where cod_grupo = 1 and cod_colaborador NOT IN (4,4650,2784,3752,1)

##Remove o grupo de Administrador do usários que não estão listados 
##no range de codigos informados
DELETE sg_grupo_colaborador
FROM sg_grupo_colaborador
where cod_grupo = 1 and cod_colaborador NOT IN (4,4650,2784,3752,1)

