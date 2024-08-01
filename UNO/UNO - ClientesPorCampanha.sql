SELECT *
FROM fn_plano_conta
WHERE conta = "500";

SELECT cli.cod_cliente, cli.nome_cliente, camp.desc_abrev
FROM cd_cliente AS cli
JOIN cd_campanha AS camp ON cli.cod_campanha = camp.cod_campanha
WHERE cli.situacao <> 0 AND cli.cod_campanha IS NOT NULL;