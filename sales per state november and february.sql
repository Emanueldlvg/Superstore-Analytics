/* 3. Sales per state bulan november dan february? = done  */

WITH
salesnov(nov)
as (select distinct "state", sum(sales) as "november_sales ($)"
	from public."SUPERSTORE"
	where order_date like '%/11/%' or order_date like '%/011/%'
	group by state
	order by "november_sales ($)" asc),
salesfeb(feb)	
as (select distinct "state", sum(sales) as "february_sales ($)"
	from public."SUPERSTORE"
	where order_date like '%/2/%' or order_date like '%/02/%'
	group by "state"
	order by "february_sales ($)" asc)
	
select feb as "state", "november_sales ($)", "february_sales ($)"
from 
(salesfeb left join salesnov
on salesfeb.feb = salesnov.nov)
order by "november_sales ($)", "february_sales ($)";
