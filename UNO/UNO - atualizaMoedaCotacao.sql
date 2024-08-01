/*Data 22-03-2017
Retorna as cotações de moedas informadas no sistema
E insere uma uma nova cotação no sistema
*/
#Retorna
set @moeda = 'US$';
SELECT *
FROM cd_moeda_cotacao
WHERE moeda = @moeda;

#Insere nova Cotação
set @moeda = 'US$';
set @dt_cotacao = now();
set @vl_cotacao = 3.0939;
INSERT cd_moeda_cotacao (moeda,dt_cotacao,vl_cotacao)
values ('@moeda',@dt_cotacao,@vl_cotacao);

