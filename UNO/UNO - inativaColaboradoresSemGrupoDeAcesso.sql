/*Data:2017-07-02
Objetivo: Inativar usuários que não possuam associação a nenhum grupo de Acesso. 
Remove Acesso Externo, Id de Usuário, dica de senha
*/
START TRANSACTION;
UPDATE sg_colaborador
SET id_usuario =  NULL, ind_acesso_total = 0, hora_acesso_inicial = '00:00:00', 
hora_acesso_final = '00:01:00', dica_senha = NULL
WHERE sg_colaborador.cod_colaborador NOT IN (SELECT cod_colaborador
															FROM sg_grupo_colaborador);
COMMIT;
ROLLBACK;


