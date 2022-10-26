/* 4. ship mode yang digunakan pada bulan november dan february = done */ 

WITH
shipnov(nov)
	as (SELECT
		ship_mode, count(ship_mode) AS qty_nov
		FROM
		public."SUPERSTORE"
		WHERE
			(ship_mode = 'Standard Class'  OR
			ship_mode = 'Second Class'  OR
			ship_mode = 'First Class'  OR
			ship_mode = 'Same Day') and 
			order_date like '%/11/%' or order_date like '%/011/%'
	Group by country, ship_mode
	Order by qty_nov desc),
shipfeb(feb)
	as (SELECT
		ship_mode, count(ship_mode) AS qty_feb
		FROM
		public."SUPERSTORE"
		WHERE
			(ship_mode = 'Standard Class'  OR
			ship_mode = 'Second Class'  OR
			ship_mode = 'First Class'  OR
			ship_mode = 'Same Day') and 
			order_date like '%/2/%' or order_date like '%/02/%'
	Group by country, ship_mode
	Order by qty_feb desc)
	
select nov as ship_mode, qty_nov, qty_feb
from 
(shipfeb left join shipnov
on shipnov.nov = shipfeb.feb);
	