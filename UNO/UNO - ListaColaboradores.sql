select cod_colaborador as 'C�digo', nome_colaborador as 'Nome',email as 'E-mail',
case 
	when situacao = 0 then 'Inativo'
	when situacao = 1 then 'Ativo'
	when situacao = 2 then 'F�rias'
	when situacao = 3 then 'Afastado'
	when situacao = 4 then 'Bloqueado'
	when situacao = 5 then 'Demitido'
	when situacao = 9 then 'Morte' else 'Inv�lida' end 'Situa��o',
	case 
	when ind_acesso_total = 0x31 then 'SIM'
	when ind_acesso_total = 0x30 then 'N�O'
	else 'Invalido' end 'Permite Acesso Ip Total'
from sg_colaborador