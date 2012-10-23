# mysql -  myqlのtimezoneがUTCのとき、jstに時刻に変換したい

convert_tzを使う

```mysql
select convert_tz(
	now(), 
    'utc',
    'Asia/Tokyo'
); 
```

現在のセッションだけtimezonを変更する


```mysql
show variables like '%time_zone%';
set time_zone='asia/tokyo';
select now();
```

