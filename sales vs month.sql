/* 1. sales berdasarkan bulan? = done */

With 
salesjan(january)
	as (select sum(sales)
	 	from public."SUPERSTORE"
	 		where order_date like '%/1/%' or order_date like '%/01/%'),
salesfeb(february)
	as (select sum(sales)
	 	from public."SUPERSTORE"
	 		where order_date like '%/2/%' or order_date like '%/02/%'),
salesmar(march)
	as (select sum(sales)
	 	from public."SUPERSTORE"
	 		where order_date like '%/3/%' or order_date like '%/03/%'),
salesap(april)
	as (select sum(sales)
	 	from public."SUPERSTORE"
	 		where order_date like '%/4/%' or order_date like '%/04/%'),
salesmay(may)
	as (select sum(sales)
	 	from public."SUPERSTORE"
	 		where order_date like '%/5/%' or order_date like '%/05/%'),
salesjun(june)
	as (select sum(sales)
	 	from public."SUPERSTORE"
	 		where order_date like '%/6/%' or order_date like '%/06/%'),
salesjul(july)
	as (select sum(sales)
	 	from public."SUPERSTORE"
	 		where order_date like '%/7/%' or order_date like '%/07/%'),
salesaug(august)
	as (select sum(sales)
	 	from public."SUPERSTORE"
	 		where order_date like '%/8/%' or order_date like '%/08/%'),
salessep(september)
	as (select sum(sales)
	 	from public."SUPERSTORE"
	 		where order_date like '%/9/%' or order_date like '%/09/%'),
salesoct(october)
	as (select sum(sales)
	 	from public."SUPERSTORE"
	 		where order_date like '%/10/%' or order_date like '%/010/%'),
salesnov(november)
	as (select sum(sales)
	 	from public."SUPERSTORE"
	 		where order_date like '%/11/%' or order_date like '%/011/%'),
salesdes(desember)
	as (select sum(sales)
	 	from public."SUPERSTORE"
	 		where order_date like '%/12/%' or order_date like '%/012/%'),
bulan("12") 
	as (select order_date,
		case
	   		when order_date like '%/1/%' or order_date like '%/01/%' then 'JANUARY'
			when order_date like '%/2/%' or order_date like '%/02/%' then 'FEBRUARY'
			when order_date like '%/3/%' or order_date like '%/03/%' then 'MARCH'
			when order_date like '%/4/%' or order_date like '%/04/%' then 'APRIL'
			when order_date like '%/5/%' or order_date like '%/05/%' then 'MAY'
			when order_date like '%/6/%' or order_date like '%/06/%' then 'JUNE'
			when order_date like '%/7/%' or order_date like '%/07/%' then 'JULY'
			when order_date like '%/8/%' or order_date like '%/08/%' then 'AUGUST'
			when order_date like '%/9/%' or order_date like '%/09/%' then 'SEPTEMBER'
			when order_date like '%/10/%' or order_date like '%/010/%' then 'OCTOBER'
			when order_date like '%/11/%' or order_date like '%/011/%' then 'NOVEMBER'
      	else 'DESEMBER'
		END as "12month"
 	from public."SUPERSTORE"),
bulandtnt("months")
	as (select distinct "12month"
		from bulan),
sales(smonths)
	as (select months,
		case
			when months = 'JANUARY' then "january"
			when months = 'FEBRUARY' then "february"
			when months = 'MARCH' then "march"
			when months = 'APRIL' then "april"
			when months = 'MAY' then "may"
			when months = 'JUNE' then "june"
			when months = 'JULY' then "july"
			when months = 'AUGUST' then "august"
			when months = 'SEPTEMBER' then "september"
			when months = 'OCTOBER' then "october"
			when months = 'NOVEMBER' then "november"
		else "desember"
		END AS "sales ($)"
	from bulandtnt, salesjan, salesfeb, salesmar, salesap, salesmay, 
		salesjun, salesjul, salesaug, salessep, salesoct, salesnov, salesdes
	group by months, january, february, march, april, may, june, july, 
		august, september, october, november, desember)
		
select smonths, "sales ($)"
from sales
order by "sales ($)" desc;