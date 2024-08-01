/*Data: 2022/05/20
Objetivo: Retornar Situção de pedido aos quais os usuários possuem acesso liberado
Podendo filtrar pela descriação da situação e situação do usuários
###################
Dados possiveis a serem utilizados na Variavel @situacao_usuario
[0 - inativo|1 - ativo|2 - férias|3 - afastado|4 - bloqueado|5 - demitido|9 - morte]
*/

SET @situacao_pedido = 'Gerar Link de Pagamento';
SET @situacao_usuario = 1;

SELECT colab.cod_colaborador, colab.nome_colaborador, sit.cod_controle, sit.descricao
	FROM sg_colaborador AS colab LEFT JOIN vd_ponto_controle_colaborador AS control
		ON colab.cod_colaborador = control.cod_colaborador
	LEFT JOIN vd_ponto_controle AS sit
		ON sit.cod_controle = control.cod_controle
WHERE sit.descricao = @situacao_pedido
	AND colab.situacao = @situacao_usuario