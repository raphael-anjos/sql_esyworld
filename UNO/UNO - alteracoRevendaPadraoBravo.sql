##atualização Bravo
/*Atualização do cadastro de CLIENTES DA REVENDA 4333 - BRAVO TECNOLOGIA
Realiza a alteração no cadastro dos clientes que estavam com revenda padrão 1518
para 4333 , a notificação da alteração esta nas Observações do cliente.
*/
UPDATE cd_cliente
SET observacao = CONCAT(observacao,'  ---  ALTERADA REV.PADRAO 1518 >> 4333') 
WHERE cod_colaborador_revenda = 4333

UPDATE cd_cliente
SET observacao = 'ALTERADA REV.PADRAO 1518 >> 4333'
WHERE cod_colaborador_revenda = 4333 and observacao is null
