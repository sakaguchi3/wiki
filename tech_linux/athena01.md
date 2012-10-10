# aws athena - 時間関数



## unixtime => 時間に変換


```sql
select 
   unixtime
--       ==> 1629126606	(JSTだと2021/8/17 00:10:06)
   
  , FROM_UNIXTIME(unixtime)  AT TIME ZONE 'Asia/Tokyo' as from_unixtime_jst1
--       ==> 2021-08-17 00:10:06.000 Asia/Tokyo	

  , FROM_UNIXTIME(unixtime, 'Asia/Tokyo') as from_unixtime_jst2
--       ==> 2021-08-17 00:10:06.000 Asia/Tokyo	

  , date_format(FROM_UNIXTIME(unixtime, 'Asia/Tokyo'), '%Y-%m-%d %H:%i:%S') as date_format_jst1
--       ==> 2021-08-17 00:10:06	

  , date_format(FROM_UNIXTIME(unixtime), '%Y-%m-%d %H:%i:%S') as date_format_utc
--       ==> 2021-08-16 15:10:06 
```

