# TreaasureData



## Time関連よく使う



```sql
SELECT
  -- TD_TIME_FORMAT: (long, _, _) -> str
  TD_TIME_FORMAT(t1.time, 'yyyy-MM-dd HH:mm:ss', 'JST') as "JST",

  -- TD_DATE_TRUNCATE: long -> unix_time  
  TD_DATE_TRUNC('minute',  time, 'JST' ) AS mnt,
  TD_DATE_TRUNC('hour',    time, 'JST' ) AS h,
  TD_DATE_TRUNC('day',     time, 'JST' ) AS d,
  TD_DATE_TRUNC('week',    time, 'JST' ) AS w,
  TD_DATE_TRUNC('month',   time, 'JST' ) AS m,
  TD_DATE_TRUNC('quarter', time, 'JST' ) AS q,
  TD_DATE_TRUNC('year',    time, 'JST' ) AS y,

  -- TD_TIME_PARSE: (str, _) -> unix_time
  TD_TIME_PARSE('2020-04-06 20:00:00', 'JST') "unixtime_start" , 
  TD_TIME_PARSE('2020-04-22 12:50:00', 'JST') "unixtime_end" ,

  --
  NOW(), -- datetime with timezone
  -- f: datetime -> str
  CAST(NOW() as varchar), 
  -- f: datetime -> long
  TO_UNIXTIME(now()), 

FROM access_log t1 

WHERE TRUE
  AND TD_INTERVAL(t1,time, '-1d/now')
  AND TD_INTERVAL(t1,time, '-1d/2019-03-25')
  AND TD_TIME_RANGE(t1.time, '2020-03-24', '2020-03-25', 'JST')
  AND TD_TIME_RANGE(t1.time, '2020-03-24', TD_TIME_ADD('2020-03-24', '1d))
  AND TD_TIME_RANGE(t1.time, '2020-04-15', null)
  -- TD_TIME_RANGE: long -> bool
  -- TD_TIME_PARSE: str -> long
  -- TD_TIME_ADD: str -> long 
  AND TD_TIME_RANGE(time
        , TD_TIME_ADD(TD_TIME_PARSE(CAST(NOW() AS VARCHAR)), '-2day', 'JST')
        , TD_TIME_ADD(TD_TIME_PARSE(CAST(NOW() AS VARCHAR)), '-1day', 'JST')
        ,'JST')
  AND FALSE      
```

## 10分ごとに集計する

```sql 
WITH w20 AS(
  SELECT
    TD_DATE_TRUNC('minute',  time, 'JST' ) / 600 * 600 AS time, --10分で切捨てする
    r.logid,
    count() as cnt,
    1 
  FROM access_log r
  WHERE  td_interval(time,'-3h','JST') 
  GROUP BY 
    r.logid, 
    TD_DATE_TRUNC('minute',  time, 'JST' ) / 600 -- 10分
)
SELECT 
  TD_TIME_FORMAT(t1.time, 'yyyy-MM-dd HH:mm:ss', 'JST'),
  count(t1.cnt),
  ''
FROM w20 t1
WHERE true
GROUP BY t1.time
ORDER BY t1.time


```


## 定数っぽいやり方

時刻の範囲指定する際に、複数箇所に書くのがめんどくさい。  
出来れば定数っぽいことをして、一箇所で定義できるようにしたい。  

```
with  CONST AS (
  SELECT ''
    , TD_TIME_PARSE('2020-04-11 15:00:00', 'JST') "unixtime_start" -- long 
    , TD_TIME_PARSE('2020-04-11 17:00:00', 'JST') "unixtime_end" -- long
), 
req as (
  select r.*
  from test_db.access_logs r, CONST c
  where  true
      AND (r.time between c.unixtime_start and c.unixtime_end )
      AND r.type='reques'
), 
res as (
  select r.*
  from test_db.access_logs r, CONST c
  where  true
      AND (r.time between c.unixtime_start and c.unixtime_end )
      AND r.type='ressponse'
)

select TD_TIME_FORMAT(t1.time,'yyyy-MM-dd HH:mm:ss','JST') as "jst"
  , t1.logid
  , t1.session
  , t1.data
  , t2.data
from  req t1 , res t2   
where  true
  AND (t1.logid = t2.logid  AND t1.session = t2.session)
limit 300 
```


## TIME 関数 


## 参考

* https://support.treasuredata.com/hc/ja/articles/115011438008-%E5%88%9D%E7%B4%9A%E3%83%8F%E3%83%B3%E3%82%BA%E3%82%AA%E3%83%B3-TD%E9%96%A2%E6%95%B0-%E3%82%A2%E3%82%AF%E3%82%BB%E3%82%B9%E3%83%AD%E3%82%B0%E7%B7%A8-
* https://support.treasuredata.com/hc/en-us/articles/360001450828-Supported-Presto-and-TD-Functions