# Database初期設定


## Database 作成

デフォルト文字コード指定しておく。
これやらないとラテン語とかになってしまって、varcharで日本語が使えなくなる。
```sql
CREATE DATABASE ushidb CHARACTER SET utf8;
```

utf8以外にも使いたい場合は、使用可能な文字コードを調べる。
```sql
SHOW CHARACTER SET ;
```
http://mysql.javarou.com/dat/000571.html


## Dtabase 名の変更
Database名を間違えて作ってしまったときとか。
```sql
rename ushidb to kabadb ;
```
## DB削除
```sql
DROP DATABASE db_name;
```


## user 作成

```sql
CREATE USER 'ushi'@'192.168.%.%' IDENTIFIED BY 'パスワード';
```




## ホストの接続許可の設定(権限付与)

### すべての権限を付与
```sql
  grant all privileges on kabadb.* to 'allprev'@'192.168.%.%' identified by 'パスワード' with grant option;
  FLUSH PRIVILEGES;
```
いきなり「GRANT」でもユーザ作成できちゃうけど、お作法では「CREATE USER」してから「GRANT」をする方が良い。
「GRANT」はあくまでも、既に作成済みのユーザに対して権限を付与するという機能なので。
ただ、「NO USER」の場合にはデフォルトだとユーザ作成するという設定になっている。  
http://ext.omo3.com/linux/mysql_host.html


### SELECT権限のみを付与
```sql
mysql> GRANT SELECT ON ushidb.* TO readonly@'localhost' IDENTIFIED BY 'pass';
mysql> GRANT SELECT ON ushidb.* TO readonly@'192.168.%.%' IDENTIFIED BY 'pass';
mysql> FLUSH PRIVILEGES;
```

## ユーザ削除
削除するユーザを確認する
``` sql
mysql> select user, password, host from mysql.user;
+----------+-------------------------------------------+-----------------------+
| user     | password                                  | host                  |
+----------+-------------------------------------------+-----------------------+
| root     |                                           | localhost             |
| root     |                                           | 127.0.0.1             |
| root     |                                           | ::1                   |
|          |                                           | localhost             |
| ushi     | *AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA | localhost             |
| readonly | *AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA | localhost             |
| readonly | *AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA | 172.20.0.%            |
+----------+-------------------------------------------+-----------------------+
```
ユーザを削除する
```sql
mysql> DROP USER readonly@'172.20.0.%' ;
```


## 権限剥奪

削除したいユーザを確認する
```sql
mysql> show grants for 'readonly'@'172.20.0.%' ;
+------------------------------------------------------------------------------------------------------------------                                                                                                                          +
| Grants for readonly@172.20.0.%                                                                                                                                                                                                             |
+------------------------------------------------------------------------------------------------------------------                                                                                                                          +
| GRANT USAGE ON *.* TO 'readonly'@'172.20.0.%' IDENTIFIED BY PASSWORD '*AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA'                                                                                                                           |
| GRANT SELECT ON `ushidb`.* TO 'readonly'@'172.20.0.%'                                                                                                                                                                                   |
+------------------------------------------------------------------------------------------------------------------
```

権限削除する
```sql
mysql> REVOKE SELECT ON `ushidb`.* FROM 'readonly'@'172.20.0.%' ;
mysql> REVOKE  ALL PRIVILEGES, GRANT OPTION   FROM 'readonly'@'172.20.0.%' ;

```



## 登録されているユーザを調べる
MySQL5.7以降はpassword→authentication_stringにカラム名が変更されたようです。
```mysql
# mysql 5.6 以前
select user, password, host from mysql.user;
# mysql 5.7 以降
SELECT user, host, authentication_string FROM mysql.user;
```

テーブルのカラム名を調べる
```sql
desc mysql.user ;
```
以下で実行できるコマンド(e.g. select, insert, update, delete)も調べること出来ます。
```sql
show full columns from ushidb.m_goods;
```



## 参考
* http://phpbb.ntsup.jp/viewtopic.php?f=8&t=30
* https://yoku0825.blogspot.jp/2015/03/mysql-576mysqluser.html
* http://ext.omo3.com/linux/mysql_host.html
* [FromtPage 調べる.DB](http://db.just4fun.biz/?MySQL/MySQL%E3%81%A7%E3%83%86%E3%83%BC%E3%83%96%E3%83%AB%E3%81%AE%E6%A7%8B%E9%80%A0%E3%82%92%E7%A2%BA%E8%AA%8D%E3%81%99%E3%82%8B%E6%96%B9%E6%B3%95%E3%83%BBDESC%E4%BB%A5%E5%A4%96%E3%81%AE%E3%82%B3%E3%83%9E%E3%83%B3%E3%83%89%E3%82%82%E8%A8%98%E8%BF%B0)