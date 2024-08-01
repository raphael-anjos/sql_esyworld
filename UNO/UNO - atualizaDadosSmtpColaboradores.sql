##DATA DE CRIAÇÃO: 2016-04-07
##DATA DE EXECUÇÃO: 2016-04-07
##INSERCAO DE ENDEREÇO E PORTA DE COMUNICAÇÃO PARA SERVIDOR DE E-MAIL DOS COLABORADORES
##OBJETIVO:
##REALIZAR O ENVIO DE PEDIDO COTAÇÃO POR DENTRO DO SISTEMA ONDE O REMETENTE SERÁ O VENDEDOR.

#Retorna todos os colaboradores cadastrados que possuem e-mail com dominio(esy.com.br)
select *
from sg_colaborador
where email like '%@esy.com.br';

#Retorna todos os colaboradores cadastrados que possuem e-mail com dominio(esy.com.br)
#Esta é a entidade em que são armazenado os dados de servidor smtp porta e protocolo.
select *
from sg_colaborador_empresa
where email like '%@esy.com.br';

#Realiza o update configurando endereço de servidor smtp, porta e protocolo.	
update sg_colaborador_empresa
set smtp = 'smtp.office365.com', porta_smtp = 587 ,
ind_tls = 1 , ind_ssl = 0, ind_email_pedido_vendedor = 1
where email like '%@esy.com.br';




