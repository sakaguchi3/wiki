SELECT
		  1
		, g.id
		, g.name

FROM mydb.mytable g

where 1
	and g.name like '%\n%'
	and g.delete_flg=0

;