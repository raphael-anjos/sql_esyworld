/*Data:18/04/2016
Realizar alteração do banco padrão dos 
clientes e pedidos ainda não faturados
Os scripts abaixo mostram a alteração para o banco 343*/

set @codEmpresa = 1;
set @codBanco = 668;
##Altera Banco Padrão por empresa no cadastro básico do ERP
UPDATE cd_param_empresa
SET valor = @codBanco
WHERE cod_empresa = @codEmpresa AND nome_param = 'bancoPadrao';

##Altera o código de banco Padrão para todos os clientes relacionados a empresa 1.
update cd_cliente_empresa
set cod_banco = @codBanco
where cod_empresa = @codEmpresa;

##Altera banco no Pedido que ainda não foi faturado.
UPDATE vd_pedido
SET cod_banco = @codBanco
WHERE situacao < 70 AND cod_empresa = @codEmpresa;

##Altera o banco padrão dos titulos a receber com situação Efetiva
UPDATE fn_titulo_receber 
SET cod_banco = @codBanco
WHERE situacao = 5 AND cod_empresa = @codEmpresa

/*##Situações de titulos:
5 - Previsão
10 - Efetiva
15 - Protestado
95 - Sem Previsão
100 - Perdido
105 - Acordo */
