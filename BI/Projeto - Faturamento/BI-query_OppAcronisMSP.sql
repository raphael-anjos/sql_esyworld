SELECT 
			opp.cod_oportunidade, opp.cod_status,opp.cod_cliente, cli.razao_social, count(ped.cod_pedido)
			FROM at_oportunidade AS opp
			LEFT JOIN cd_cliente AS cli
			ON cli.cod_cliente = opp.cod_cliente
                        LEFT JOIN vd_pedido as ped
                        ON ped.cod_oportunidade = opp.cod_oportunidade
			
WHERE opp.cod_familia_comercial = 39
GROUP BY opp.cod_oportunidade;