/*SELECT cod_oportunidade, dt_abertura, dt_deadline, dt_status
FROM at_oportunidade 
WHERE cod_oportunidade BETWEEN 50829 AND 51294;

START TRANSACTION;
UPDATE at_oportunidade
SET dt_abertura = '2019-08-23', dt_status = '2019-08-23'
WHERE cod_oportunidade BETWEEN 50829 AND 51294;
COMMIT;
*/
SELECT item.cod_oportunidade, SUM(item.qtd),SUM(item.preco_venda*item.qtd) AS total
FROM at_oportunidade_item AS item
GROUP BY item.cod_oportunidade
HAVING item.cod_oportunidade BETWEEN 50829 AND 51294
ORDER BY total;

SELECT SUM(item.preco_venda*item.qtd)
FROM at_oportunidade_item AS item
WHERE item.cod_oportunidade BETWEEN 50829 AND 51294;

START TRANSACTION; 
UPDATE at_oportunidade AS op JOIN (SELECT item.cod_oportunidade AS cod_oportunidade, 
SUM(item.qtd * item.preco_venda) AS totalestimado
FROM at_oportunidade_item AS item
GROUP BY item.cod_oportunidade) AS opTotal
ON op.cod_oportunidade = opTotal.cod_oportunidade
SET op.vl_estimado = opTotal.totalestimado
WHERE op.cod_oportunidade IN (3,50348)
COMMIT;