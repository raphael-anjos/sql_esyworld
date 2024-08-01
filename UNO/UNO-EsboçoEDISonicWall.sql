-- Pedido de compra 2159
SELECT DISTINCT cc_pedido.cod_pedido_compra,
				cc_pedido.situacao, cc_pedido.dt_previsao_entrega,
				cd_fornecedor.cod_fornecedor,
				cc_pedido_situacao.desc_abrev,
				cd_fornecedor.nome_fantasia 
	FROM cc_pedido LEFT JOIN cd_fornecedor 
	ON cd_fornecedor.cod_fornecedor = cc_pedido.cod_fornecedor
		LEFT JOIN cc_pedido_situacao 
		ON cc_pedido_situacao.situacao = cc_pedido.situacao
			WHERE cc_pedido.cod_empresa =1 
			AND cc_pedido.cod_pedido_compra = 2159 
			ORDER BY cc_pedido.cod_pedido_compra 
			DESC LIMIT 0, 50 

=======================================================================
SELECT tpco.tp_colaborador, clco.descricao, clco.sistema, clco.programa, clco.tela_inicial  FROM sg_tp_colaborador as tpco, sg_classificacao_colaborador clco  WHERE tpco.cod_colaborador = 4650 AND  tpco.tp_colaborador = clco.tp_colaborador;
SELECT * FROM sg_colaborador_meta LEFT JOIN vd_meta ON (sg_colaborador_meta.cod_meta = vd_meta.cod_meta) LEFT JOIN cd_familia_comercial ON (sg_colaborador_meta.cod_familia_comercial = cd_familia_comercial.cod_familia_comercial) WHERE sg_colaborador_meta.cod_colaborador = 4650;
SELECT m.* FROM vd_meta m LEFT JOIN sg_colaborador c ON( m.cod_meta = c.cod_meta )   WHERE c.cod_colaborador = 4650;
************************

MySQLCCDAO - findAllPontoControle************************
SELECT *  FROM cc_pedido_item_situacao ORDER BY situacao
************************
MySQLCCDAO - findCompraSituacaoByWhereComPermissao************************
 SELECT *  FROM cc_pedido_situacao WHERE cc_pedido_situacao.situacao < 40
MySQLCCDAO - findCompraByPK************************
 SELECT cc_pedido.*, cd_fornecedor.nome_fantasia  FROM cc_pedido LEFT JOIN cd_fornecedor ON (cd_fornecedor.cod_fornecedor = cc_pedido.cod_fornecedor) WHERE cc_pedido.cod_pedido_compra = '2159' AND cc_pedido.cod_empresa = '1'
************************
MySQLCCDAO - findAllPedidoCompraArquivo************************
SELECT *  FROM cc_pedido_arquivo  WHERE cc_pedido_arquivo.cod_pedido_compra = 2159 AND  cc_pedido_arquivo.cod_empresa = 1  ORDER BY cc_pedido_arquivo.cod_arq
************************
MySQLFNDAO - findTituloPagarByWhere booleans ************************
 SELECT fn_titulo_pagar.*, sg_colaborador.nome_colaborador, cd_fornecedor.nome_fantasia,  cd_forma_pagto.desc_abrev, cd_forma_pagto.tp_pagto, fn_especie.desc_abrev , cd_fornecedor.cnpj,  sg_colaborador.cnpj, sg_colaborador.cod_banco, sg_colaborador.agencia, sg_colaborador.ccorrente,  fn_plano_conta.desc_abrev, cd_banco.ind_pagamento_escritural, cd_banco.tipo, cd_banco.agencia, cd_banco.ccorrente  FROM fn_especie, fn_titulo_pagar  LEFT JOIN cd_fornecedor ON ( fn_titulo_pagar.cod_fornecedor = cd_fornecedor.cod_fornecedor ) LEFT JOIN cd_banco ON ( cd_banco.cod_banco = fn_titulo_pagar.cod_banco AND cd_banco.cod_empresa = fn_titulo_pagar.cod_empresa ) LEFT JOIN sg_colaborador ON ( fn_titulo_pagar.cod_colaborador = sg_colaborador.cod_colaborador ) LEFT JOIN cd_forma_pagto ON ( fn_titulo_pagar.cod_forma_pagto = cd_forma_pagto.cod_forma_pagto ) LEFT JOIN fn_plano_conta ON (fn_titulo_pagar.conta = fn_plano_conta.conta AND fn_titulo_pagar.sub_conta = fn_plano_conta.sub_conta) LEFT JOIN fn_centro_custo ON (fn_titulo_pagar.ccusto = fn_centro_custo.ccusto) WHERE fn_titulo_pagar.situacao < 30 AND fn_especie.cod_especie = fn_titulo_pagar.cod_especie  AND fn_titulo_pagar.cod_pedido_compra = 2159 AND ( fn_centro_custo.ccusto is null OR fn_centro_custo.ind_colaborador = '0'  OR EXISTS( 
  SELECT * 
  FROM fn_centro_custo_colaborador 
  WHERE 
        fn_centro_custo_colaborador.ccusto = fn_centro_custo.ccusto 
        AND 
        fn_centro_custo_colaborador.cod_colaborador IN ( null ) 
) ) AND fn_titulo_pagar.cod_especie = 96 ORDER BY fn_titulo_pagar.dt_vencimento, cod_titulo
************************
MySQLCDDAO - findNOPByPK************************
 SELECT * FROM cd_nop WHERE nop = null
************************
MySQLCCDAO - findAllItemCompra************************
 SELECT * FROM cc_pedido_item  LEFT JOIN cc_pedido_item_situacao ON ( cc_pedido_item_situacao.situacao = cc_pedido_item.situacao )   LEFT JOIN fn_plano_conta ON (cc_pedido_item.conta = fn_plano_conta.conta AND cc_pedido_item.sub_conta = fn_plano_conta.sub_conta)  LEFT JOIN vd_pedido ON ( vd_pedido.cod_pedido = cc_pedido_item.cod_pedido_venda AND vd_pedido.cod_empresa = cc_pedido_item.cod_empresa ),  cd_produto, cd_produto_empresa  WHERE cc_pedido_item.cod_empresa = '1' AND  cc_pedido_item.cod_pedido_compra = '2159' AND  cc_pedido_item.cod_produto = cd_produto.cod_produto AND  ( cc_pedido_item.id_cod_produto_promocao is null OR cc_pedido_item.id_cod_produto_promocao = '' ) AND cd_produto_empresa.cod_empresa = '1' AND  cd_produto_empresa.cod_produto = cd_produto.cod_produto  ORDER BY cc_pedido_item.nr_sequencia_cc 
MySQLCCDAO - findAllItemCompra************************
 SELECT * FROM cc_pedido_item  LEFT JOIN cc_pedido_item_situacao ON ( cc_pedido_item_situacao.situacao = cc_pedido_item.situacao )   LEFT JOIN fn_plano_conta ON (cc_pedido_item.conta = fn_plano_conta.conta AND cc_pedido_item.sub_conta = fn_plano_conta.sub_conta)  LEFT JOIN vd_pedido ON ( vd_pedido.cod_pedido = cc_pedido_item.cod_pedido_venda AND vd_pedido.cod_empresa = cc_pedido_item.cod_empresa ),  cd_produto, cd_produto_empresa  WHERE cc_pedido_item.cod_empresa = '1' AND  cc_pedido_item.cod_pedido_compra = '2159' AND  cc_pedido_item.cod_produto = cd_produto.cod_produto AND  cc_pedido_item.id_cod_produto_promocao = '1' AND  cd_produto_empresa.cod_empresa = '1' AND  cd_produto_empresa.cod_produto = cd_produto.cod_produto  ORDER BY cc_pedido_item.nr_sequencia_cc 
MySQLCCDAO - findAllItemCompra************************
 SELECT * FROM cc_pedido_item  LEFT JOIN cc_pedido_item_situacao ON ( cc_pedido_item_situacao.situacao = cc_pedido_item.situacao )   LEFT JOIN fn_plano_conta ON (cc_pedido_item.conta = fn_plano_conta.conta AND cc_pedido_item.sub_conta = fn_plano_conta.sub_conta)  LEFT JOIN vd_pedido ON ( vd_pedido.cod_pedido = cc_pedido_item.cod_pedido_venda AND vd_pedido.cod_empresa = cc_pedido_item.cod_empresa ),  cd_produto, cd_produto_empresa  WHERE cc_pedido_item.cod_empresa = '1' AND  cc_pedido_item.cod_pedido_compra = '2159' AND  cc_pedido_item.cod_produto = cd_produto.cod_produto AND  cc_pedido_item.id_cod_produto_promocao = '2' AND  cd_produto_empresa.cod_empresa = '1' AND  cd_produto_empresa.cod_produto = cd_produto.cod_produto  ORDER BY cc_pedido_item.nr_sequencia_cc 
MySQLCCDAO - findAllItemCompra************************
 SELECT * FROM cc_pedido_item  LEFT JOIN cc_pedido_item_situacao ON ( cc_pedido_item_situacao.situacao = cc_pedido_item.situacao )   LEFT JOIN fn_plano_conta ON (cc_pedido_item.conta = fn_plano_conta.conta AND cc_pedido_item.sub_conta = fn_plano_conta.sub_conta)  LEFT JOIN vd_pedido ON ( vd_pedido.cod_pedido = cc_pedido_item.cod_pedido_venda AND vd_pedido.cod_empresa = cc_pedido_item.cod_empresa ),  cd_produto, cd_produto_empresa  WHERE cc_pedido_item.cod_empresa = '1' AND  cc_pedido_item.cod_pedido_compra = '2159' AND  cc_pedido_item.cod_produto = cd_produto.cod_produto AND  cc_pedido_item.id_cod_produto_promocao = '3' AND  cd_produto_empresa.cod_empresa = '1' AND  cd_produto_empresa.cod_produto = cd_produto.cod_produto  ORDER BY cc_pedido_item.nr_sequencia_cc 
MySQLCCDAO - findAllItemCompra************************
 SELECT * FROM cc_pedido_item  LEFT JOIN cc_pedido_item_situacao ON ( cc_pedido_item_situacao.situacao = cc_pedido_item.situacao )   LEFT JOIN fn_plano_conta ON (cc_pedido_item.conta = fn_plano_conta.conta AND cc_pedido_item.sub_conta = fn_plano_conta.sub_conta)  LEFT JOIN vd_pedido ON ( vd_pedido.cod_pedido = cc_pedido_item.cod_pedido_venda AND vd_pedido.cod_empresa = cc_pedido_item.cod_empresa ),  cd_produto, cd_produto_empresa  WHERE cc_pedido_item.cod_empresa = '1' AND  cc_pedido_item.cod_pedido_compra = '2159' AND  cc_pedido_item.cod_produto = cd_produto.cod_produto AND  cc_pedido_item.id_cod_produto_promocao = '4' AND  cd_produto_empresa.cod_empresa = '1' AND  cd_produto_empresa.cod_produto = cd_produto.cod_produto  ORDER BY cc_pedido_item.nr_sequencia_cc 
MySQLCCDAO - findAllpagamentoCompra************************
 SELECT * FROM cc_pedido_pagto  WHERE cod_empresa = 1 AND  cod_pedido_compra = 2159
MySQLTransportadoraDAO - findTransportadoraByPK************************
 SELECT cd_transportadora.*  FROM cd_transportadora  WHERE cd_transportadora.cod_transportadora = null
************************
MySQLCDDAO - findNOPByPKEntrada************************
 SELECT *  FROM cd_nop  WHERE nop = null AND tp_nota_fiscal != 2
************************
MySQLSGDAO - findColaboradorByPK************************
 SELECT * FROM sg_colaborador WHERE cod_colaborador = '5359'
 SELECT tpco.tp_colaborador, clco.descricao, clco.sistema, clco.programa, clco.tela_inicial  FROM sg_tp_colaborador as tpco, sg_classificacao_colaborador clco  WHERE tpco.cod_colaborador = 5359 AND  tpco.tp_colaborador = clco.tp_colaborador
SELECT * FROM sg_colaborador_meta LEFT JOIN vd_meta ON (sg_colaborador_meta.cod_meta = vd_meta.cod_meta) LEFT JOIN cd_familia_comercial ON (sg_colaborador_meta.cod_familia_comercial = cd_familia_comercial.cod_familia_comercial) WHERE sg_colaborador_meta.cod_colaborador = 5359
 SELECT m.* FROM vd_meta m LEFT JOIN sg_colaborador c ON( m.cod_meta = c.cod_meta )   WHERE c.cod_colaborador = 5359
************************
MySQLCDDAO - findCondicaoPagamentoByPK************************
 SELECT * FROM cd_cond_pagto WHERE cod_cond_pagto = '30'
MySQLCDDAO - findAllParcelaCondicaoPagamento************************
 SELECT * FROM cd_cond_pagto_parcelas WHERE cod_cond_pagto = '30' ORDER BY dias
************************
MySQLFornecedorDAO - findFornecedorByPK************************
 SELECT *  FROM cd_fornecedor  WHERE cod_fornecedor = '11945'
************************
MySQLFNDAO - findValorTotalCreditoFornecedor************************
 SELECT SUM( ftp.vl_total_titulo - IFNULL(ftp.vl_total_baixa, 0) ) AS total_credito, 
 	   GROUP_CONCAT(ftp.cod_titulo) AS codigo_titulos 
 FROM fn_titulo_pagar ftp 
 WHERE ftp.cod_empresa = '1' AND ftp.cod_fornecedor = '11945' AND ftp.cod_especie = '90' AND ftp.situacao < '30' ORDER BY ftp.dt_vencimento ASC 
************************
MySQLFornecedorDAO - findFornecedorByPK************************
 SELECT *  FROM cd_fornecedor  WHERE cod_fornecedor = null
************************
MySQLFNDAO - findCentroCustoByPK************************
    SELECT fn_centro_custo.*, 
            cd_cliente.nome_cliente 
       FROM fn_centro_custo 
  LEFT JOIN cd_cliente 
         ON ( cd_cliente.cod_cliente = fn_centro_custo.cod_cliente ) 
      WHERE fn_centro_custo.ccusto LIKE null
************************
MySQLCDDAO - findAllParametroEmpresa************************
 SELECT *  FROM cd_parametro LEFT JOIN cd_param_empresa  ON ( cd_param_empresa.cod_empresa in (1) AND  cd_param_empresa.nome_param = cd_parametro.nome_param )
************************
MySQLCDDAO - findAllMoeda************************
 SELECT * FROM cd_moeda 
************************
MySQLCDDAO - findAllCotacaoMoeda************************
 SELECT *  FROM cd_moeda_cotacao  ORDER BY dt_cotacao DESC
************************
MySQLFNDAO - getVlTitulosPagarbyCodPedidoCompra************************
SELECT * FROM fn_titulo_pagar WHERE cod_pedido_compra = '2159' AND cod_empresa = '1' AND fn_titulo_pagar.situacao < 90 ORDER BY cod_titulo, cod_parcela
************************
MySQLCDDAO - findSituacaoFormaPagamentosCorrente************************
 SELECT *  FROM cd_forma_pagto  ORDER BY desc_abrev 
************************
Contexto: /Esyworld/ Execute Metodo : buscar - Tempo Decorrido (71) : 00:00:00
FORMBEAN [CCW0001Form] TAREFA [56]
FORMBEAN [CCW0001Form] TAREFA [56]
FORMBEAN [CCW0001Form] TAREFA [56]
MySQLEQDAO - findAllDeposito************************
 SELECT *  FROM eq_deposito  WHERE cod_empresa in( 1) ORDER BY cod_empresa, cod_deposito
************************
FORMBEAN [CCW0001Form] TAREFA [56]
FORMBEAN [CCW0001Form] TAREFA [56]
FORMBEAN [CCW0001Form] TAREFA [56]
Executando tarefas
Aguardando próxima agenda