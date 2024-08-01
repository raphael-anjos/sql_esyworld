CREATE DEFINER=`uno`@`%` PROCEDURE `P_LIGUE_JA`()
BEGIN


update cd_cliente, at_oportunidade set cd_cliente.situacao = 3
where cd_cliente.cod_cliente = at_oportunidade.cod_cliente and cd_cliente.situacao = 2 and at_oportunidade.cod_status < 100;


DROP TABLE IF EXISTS tmp_cli;
CREATE TABLE tmp_cli (
       cod_cliente       int
);



INSERT INTO tmp_cli select distinct cd_cliente.cod_cliente
from cd_campanha, cd_cliente
     left join oc_ligacao on (cd_cliente.cod_cliente = oc_ligacao.cod_cliente and oc_ligacao.cod_colaborador = cd_cliente.cod_colaborador)
where cd_cliente.cod_campanha = cd_campanha.cod_campanha and
      cd_campanha.situacao = 1 and
      cd_cliente.cod_colaborador is not null and
      cd_cliente.situacao = 2 and 
      oc_ligacao.cod_ligacao is null;

update cd_cliente, tmp_cli set cd_cliente.cod_colaborador = null
where tmp_cli.cod_cliente = cd_cliente.cod_cliente;


SET @DtAux := DATE_SUB(NOW(), INTERVAL 91 DAY);
SELECT @maxSeqHistCli:=max(cd_cliente_hist.seq_hist_cli) from cd_cliente_hist;



INSERT INTO cd_cliente_hist (seq_hist_cli, cod_cliente, cod_colaborador, tp_historico, dt_referencia, origem, descricao)
SELECT @maxSeqHistCli:=@maxSeqHistCli+1, cd_cliente.cod_cliente, "1", "5", NOW(), 9, CONCAT("Desvinculado do Vendedor ", cd_cliente.cod_colaborador, " - ", sg_colaborador.nome_colaborador, " por Inatividade superior a 3 meses") 
FROM cd_cliente_endereco, cd_cliente left join at_oportunidade on (cd_cliente.cod_cliente = at_oportunidade.cod_cliente and at_oportunidade.cod_status < 100)
                                     left join sg_colaborador on (sg_colaborador.cod_colaborador = cd_cliente.cod_colaborador)
where  cd_cliente.cod_cliente = cd_cliente_endereco.cod_cliente and
       cd_cliente.situacao IN (2,3) and
       cd_cliente.dt_alteracao <= @DtAux and
       cd_cliente.cod_colaborador is not null
GROUP BY cd_cliente_endereco.cod_cliente
HAVING count(at_oportunidade.cod_oportunidade) = 0;

update cd_cliente, cd_cliente_hist
set cd_cliente.cod_colaborador = null, cd_cliente.situacao = 2, cd_cliente.dt_alteracao = NOW(), cd_cliente.cod_colaborador_alteracao = 1
where cd_cliente.cod_cliente = cd_cliente_hist.cod_cliente and 
      cd_cliente_hist.origem = 9; 


update cd_cliente, cd_cliente_hist, vd_pedido
set cod_campanha_old = cod_campanha, cod_campanha = 50, cd_cliente_hist.origem = 1
where cd_cliente.cod_cliente = cd_cliente_hist.cod_cliente and 
      vd_pedido.cod_cliente = cd_cliente_hist.cod_cliente and 
      (cd_cliente.cod_campanha in (SELECT cod_campanha from cd_campanha where situacao = 0) || cd_cliente.cod_campanha is null) and
      cd_cliente_hist.origem = 9; 


update cd_cliente, cd_cliente_hist
set cod_campanha_old = cod_campanha, cod_campanha = 37, cd_cliente_hist.origem = 1
where cd_cliente.cod_cliente = cd_cliente_hist.cod_cliente and 
      (cd_cliente.cod_campanha in (SELECT cod_campanha from cd_campanha where situacao = 0) || cd_cliente.cod_campanha is null) and
      cd_cliente_hist.origem = 9; 


END;
