/* 3. category barang terjual di bulan november dan february? */

WITH
catnov(cnov)
as (select distinct category, count(category) as qty_category_nov, sum(sales) as "sales_nov ($)"
	from public."SUPERSTORE"
	where 
		order_date like '%/11/%' or order_date like '%/011/%'
	group by category),
catfeb(cfeb)
as (select distinct category, count(category) as qty_category_feb, sum(sales) as "sales_feb ($)"
	from public."SUPERSTORE"
	where 
		order_date like '%/2/%' or order_date like '%/02/%'
	group by category)
	
		
select cfeb as product_category, qty_category_nov, qty_category_feb, "sales_nov ($)", "sales_feb ($)"
from 
(catfeb left join catnov
on catnov.cnov = catfeb.cfeb);