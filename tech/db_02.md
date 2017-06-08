# DB - Lock wait timeout exceeded; try restarting transaction が頻繁に出た時の話




### 概要
バッチ処理がすぐLock wait timeout exceeded; try restarting transactionをしてExceptionを吐いてた。  
DB側のwait timeを長くしたら解決した。




### wait time を長くする

デフォルトだと50に設定されている
```sql
mysql> SHOW global VARIABLES LIKE 'innodb_lock_wait_timeout';
+--------------------------+-------+
| Variable_name            | VALUE |
+--------------------------+-------+
| innodb_lock_wait_timeout | 50    |
+--------------------------+-------+
```

lock待ち時間を長くする
```sql
mysql> SET innodb_lock_wait_timeout=240;
mysql> SHOW global VARIABLES LIKE 'innodb_lock_wait_timeout';
+--------------------------+-------+
| Variable_name            | VALUE |
+--------------------------+-------+
| innodb_lock_wait_timeout | 240   |
+--------------------------+-------+
```


http://nanoappli.com/blog/archives/6395



### その他ロック時関連で見ていた記事とか
* http://blog.katty.in/3082
* http://bluerabbit.hatenablog.com/entry/2013/12/07/075759


