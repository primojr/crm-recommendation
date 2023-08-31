select * from customer_analytics_zone.ca_analitico_basao_crm limit 10


/*
* Quantidade de cliente no basao
*/
select 
	ds_origin
	,count(distinct id_customer) as contas 
from customer_analytics_zone.ca_analitico_basao_crm
where is_apto = true
group by 1
limit 10

/*
 * Seg. Consumo
 */
select 
	ds_seg_consumo 
	,count(distinct id_customer) as contas 
from customer_analytics_zone.ca_analitico_basao_crm
where is_apto = true
group by 1 order by 2 desc
limit 10

with tab_agg_id_mcc as (
select
	customer_id,
		replace(replace(mcc,' ','_'),'-','_') as mcc, count(*) as qtd 
from marketplace_sandbox_zone.mktp_model_segmentacao_mcc_analytical_flex_1m
where mes_ref = '2023-07' 	
group by 1,2 
limit 500
)

SELECT *
FROM (SELECT customer_id, mcc, qtd FROM tab_agg_id_mcc) 
PIVOT (
	    1 AS count 
	    FOR mcc IN ('DELIVERY','EDUCACAO')
)



select replace('dsds dd', ' ','') 



