##Altera o nome dos clientes cadastrados em letras maiusculas
UPDATE cd_cliente
SET nome_cliente = UCASE(nome_cliente)

##Aleta tipo de moeda no pedido.
UPDATE vd_pedido
SET moeda = "R$"
WHERE moeda = "KL$"

##Realiza o UPDATE do NOP inserindo na oportunidade o NOP padrão do cadastro do cliente.
UPDATE at_oportunidade as op JOIN cd_cliente as cli 
   ON op.cod_cliente = cli.cod_cliente
   SET op.nop = cli.nop
   WHERE dt_abertura >= '2016-04-01';
   
##Realiza o Update da data do próximo contato.
##Acrescentando 10 dias sobre a data de abertura.
update at_oportunidade
set dt_status = date_add(dt_abertura, INTERVAL 10 DAY)
where dt_status = '2016-04-01'

UPDATE at_oportunidade as op JOIN cd_cliente as cli 
   ON op.cod_cliente = cli.cod_cliente
   SET op.nop = cli.nop
   WHERE op.nop is null;

update at_oportunidade
set dt_status = date_add(dt_abertura, INTERVAL 10 DAY)
where dt_status = '2016-04-01' or dt_status is null
