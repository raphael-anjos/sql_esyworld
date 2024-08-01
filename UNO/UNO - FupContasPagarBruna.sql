SET @dataVencimento = DATE_FORMAT(NOW(),'%Y-%m-%d');
SELECT @dataVencimento
SELECT CONCAT(fn_titulo_pagar.cod_titulo,'\/',fn_titulo_pagar.cod_parcela) AS 'Titulo/Parc', 
fn_titulo_pagar.dt_vencimento AS 'Data Vencimento', 
CONCAT('[',cd_fornecedor.cod_fornecedor,'] - ',cd_fornecedor.razao_social) AS 'Cliente/Fornecedor', 
REPLACE(FORMAT(fn_titulo_pagar.vl_total_titulo,2),',','') AS 'Total Título',
fn_plano_conta.conta AS 'Conta',
fn_plano_conta.sub_conta AS 'Sub-Conta',
fn_plano_conta.desc_abrev AS 'Descrição', 
fn_titulo_pagar.obs_titulo AS 'Observações do Título',
fn_titulo_pagar.cod_banco AS 'Núm Banco', 
fn_titulo_pagar.agencia AS 'Agência', 
fn_titulo_pagar.ccorrente AS 'Conta Corrente', 
cd_forma_pagto.desc_abrev AS 'Forma de Pagamento'
FROM fn_titulo_pagar LEFT JOIN fn_plano_conta
ON fn_titulo_pagar.conta = fn_plano_conta.conta AND fn_titulo_pagar.sub_conta = fn_plano_conta.sub_conta
LEFT JOIN cd_forma_pagto
ON fn_titulo_pagar.cod_forma_pagto = cd_forma_pagto.cod_forma_pagto
LEFT JOIN cd_fornecedor
ON fn_titulo_pagar.cod_fornecedor = cd_fornecedor.cod_fornecedor
WHERE fn_titulo_pagar.cod_fornecedor > 0 AND 
fn_titulo_pagar.dt_vencimento = @dataVencimento
UNION ALL
SELECT CONCAT(fn_titulo_pagar.cod_titulo,'\/',fn_titulo_pagar.cod_parcela) AS 'Titulo/Parc', 
fn_titulo_pagar.dt_vencimento AS 'Data Vencimento', 
CONCAT('[',cd_cliente.cod_revenda_gerado,'] - ',cd_cliente.razao_social) AS 'Cliente/Fornecedor', 
REPLACE(FORMAT(fn_titulo_pagar.vl_total_titulo,2),',','') AS 'Total Título',
fn_plano_conta.conta AS 'Conta',
fn_plano_conta.sub_conta AS 'Sub-Conta',
fn_plano_conta.desc_abrev AS 'Descrição', 
fn_titulo_pagar.obs_titulo AS 'Observações do Título',
fn_titulo_pagar.cod_banco AS 'Núm Banco', 
fn_titulo_pagar.agencia AS 'Agência', 
fn_titulo_pagar.ccorrente AS 'Conta Corrente', 
cd_forma_pagto.desc_abrev AS 'Forma de Pagamento'
FROM fn_titulo_pagar LEFT JOIN fn_plano_conta
ON fn_titulo_pagar.conta = fn_plano_conta.conta AND fn_titulo_pagar.sub_conta = fn_plano_conta.sub_conta
LEFT JOIN cd_forma_pagto
ON fn_titulo_pagar.cod_forma_pagto = cd_forma_pagto.cod_forma_pagto
LEFT JOIN cd_cliente
ON fn_titulo_pagar.cod_colaborador = cd_cliente.cod_revenda_gerado
WHERE fn_titulo_pagar.cod_colaborador IS NOT NULL AND 
fn_titulo_pagar.dt_vencimento = @dataVencimento