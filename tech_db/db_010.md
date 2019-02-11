# DB - 権限周りの設定



## 接続可能なuser確認

```sql  
mysql> select user, password, host from mysql.user;
+----------+-------------------------------------------+-----------------------+
| user     | password                                  | host                  |
+----------+-------------------------------------------+-----------------------+
| ushi     | *AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA | localhost             |
| readonly | *AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA | localhost             |
| readonly | *AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA | 172.99.0.%            |
+----------+-------------------------------------------+-----------------------+
```

## 与えられた権限をチェックする 

#### 自分の権限を調べたい

```sql  
mysql> show grants;
+----------------------------------------------------------------------------------+
| Grants for hogeuser@localhost
+----------------------------------------------------------------------------------+
| GRANT USAGE ON *.* TO 'hgoeuser'@'hogehost' IDENTIFIED BY PASSWORD <secret>        
| GRANT ALL PRIVILEGES ON `hogedb`.* TO 'hgoeuser'@'localhost' WITH GRANT OPTION  
| GRANT ALL PRIVILEGES ON `fugadb`.* TO 'hgoeuser'@'localhost' WITH GRANT OPTION
+----------------------------------------------------------------------------------+
```


#### 他のユーザを調べたい 

「select user, password, host from mysql.user」した結果から，user, hostを取得する．  
__show grants for user@host__  
でOK．


```sql 
mysql> show grants for hogeuser@'172.99.0.%' ;
+---------------------------------------------------------------------------------------------------------------+
| Grants for hogeuser@172.99.0.%
+---------------------------------------------------------------------------------------------------------------+
| GRANT USAGE ON *.* TO 'hogeuser'@'172.99.120.%' IDENTIFIED BY PASSWORD '*BBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBB'
| GRANT ALL PRIVILEGES ON `hogedb`.* TO 'hogeuser'@'172.99.120.%' WITH GRANT OPTION                               
| GRANT ALL PRIVILEGES ON `piyodb`.* TO 'hogeuser'@'172.99.120.%' WITH GRANT OPTION                               
| GRANT SELECT ON `fugadb`.* TO 'hogeuser'@'172.99.120.%'                                                   
+---------------------------------------------------------------------------------------------------------------+
4 rows in set (0.00 sec)
```

hogedb/piyodbには全コマンド，fugadbにはSELECTのみOKみたいな感じ．  
[権限の読み方](#権限の読み方) 参照．

現在接続されているユーザの権限チェック

```sql
show grants for current_user(); 
```


## 権限の読み方

|権限     |カラム     |コンテキスト|
|:----:|  :----:| :----:|
|CREATE     |Create_priv     |データベース、テーブル、またはインデックス|
|DROP     |Drop_priv     |データベース、テーブル、またはビュー|
|GRANT OPTION     |Grant_priv     |データベース、テーブル、またはストアドルーチン|
|LOCK TABLES     |Lock_tables_priv     |データベース|
|REFERENCES     |References_priv     |データベースまたはテーブル|
|EVENT     |Event_priv     |データベース|
|ALTER     |Alter_priv     |テーブル|
|DELETE     |Delete_priv     |テーブル|
|INDEX     |Index_priv     |テーブル|
|INSERT     |Insert_priv     |テーブルまたはカラム|
|SELECT     |Select_priv     |テーブルまたはカラム|
|UPDATE     |Update_priv     |テーブルまたはカラム|
|CREATE TEMPORARY TABLES     |Create_tmp_table_priv     |テーブル|
|TRIGGER     |Trigger_priv     |テーブル|
|CREATE VIEW     |Create_view_priv     |ビュー|
|SHOW VIEW     |Show_view_priv     |ビュー|
|ALTER ROUTINE     |Alter_routine_priv     |ストアドルーチン|
|CREATE ROUTINE     |Create_routine_priv     |ストアドルーチン|
|EXECUTE     |Execute_priv     |ストアドルーチン|
|FILE     |File_priv     |サーバーホストでのファイルアクセス|
|CREATE TABLESPACE     |Create_tablespace_priv     |サーバー管理|
|CREATE USER     |Create_user_priv     |サーバー管理|
|PROCESS     |Process_priv     |サーバー管理|
|PROXY     |proxies_priv テーブルを参照     |サーバー管理|
|RELOAD     |Reload_priv     |サーバー管理|
|REPLICATION CLIENT     |Repl_client_priv     |サーバー管理|
|REPLICATION SLAVE     |Repl_slave_priv     |サーバー管理|
|SHOW DATABASES     |Show_db_priv     |サーバー管理|
|SHUTDOWN     |Shutdown_priv     |サーバー管理|
|SUPER     |Super_priv     |サーバー管理|
|ALL [PRIVILEGES]     |      |サーバー管理|

```GRANT USAGE ON *.* TO```は何も権限がない．CREATE USERした際にはこの権限になる．

* [MySQL で提供される権限](https://dev.mysql.com/doc/refman/5.6/ja/privileges-provided.html)



## 権限付与

```sql
GRANT SELECT ON  aniamldb.* to 'ushi'@'192.168.%.%' IDENTIFIED BY  'パスワード' WITH GRANT OPTION ;
FLUSH PRIVILEGES; 
```
['user'@'host'の調べ方](#接続可能なuser確認)




## 権限剥奪

```sql 
REVOKE SELECT ON  aniamldb.* to 'ushi'@'192.168.%.%'
FLUSH PRIVILEGES;
```
