# [linux] CentOS7にMySQL5.7をインストール


centos7からライセンス関連でmysqlが標準repositoryに入っていないらしい。



### mysqlリポジトリ追加

DL出来なければ公式repository確認する。  
公式repository: https://dev.mysql.com/downloads/repo/yum/  

```shell
$ sudo yum localinstall https://dev.mysql.com/get/mysql57-community-release-el7-11.noarch.rpm
```


インストール可能になったか調べる
```shell
user@server:0:% sudo yum repolist all | grep mysql
mysql-cluster-7.5-community/x86_64 MySQL Cluster 7.5 Community    disabled
mysql-cluster-7.5-community-source MySQL Cluster 7.5 Community -  disabled
mysql-cluster-7.6-community/x86_64 MySQL Cluster 7.6 Community    disabled
mysql-cluster-7.6-community-source MySQL Cluster 7.6 Community -  disabled
mysql-connectors-community/x86_64  MySQL Connectors Community     enabled:    42
mysql-connectors-community-source  MySQL Connectors Community - S disabled
mysql-tools-community/x86_64       MySQL Tools Community          enabled:    51
mysql-tools-community-source       MySQL Tools Community - Source disabled
mysql-tools-preview/x86_64         MySQL Tools Preview            disabled
mysql-tools-preview-source         MySQL Tools Preview - Source   disabled
mysql55-community/x86_64           MySQL 5.5 Community Server     disabled
mysql55-community-source           MySQL 5.5 Community Server - S disabled
mysql56-community/x86_64           MySQL 5.6 Community Server     disabled
mysql56-community-source           MySQL 5.6 Community Server - S disabled
mysql57-community/x86_64           MySQL 5.7 Community Server     enabled:   227
mysql57-community-source           MySQL 5.7 Community Server - S disabled
mysql80-community/x86_64           MySQL 8.0 Community Server     disabled
mysql80-community-source           MySQL 8.0 Community Server - S disabled
```

デフォルトだと5.7が有効になっている。
バージョンを変更したい場合は変更する。
```shell
$ sudo  yum-config-manager --disable  mysql57-community
$ sudo  yum-config-manager --enable   mysql56-community
```


MySQLのインストール
```shell
$ sudo yum install mysql-community-server
```

自動起動登録をしておく
```shell
$ sudo systemctl enable mysqld
```


文字コードを設定する
/etc/my.cnf の末尾に付け加える
```
character_set_server=utf8
skip-character-set-client-handshake
```


デフォルトのrootパスワードを確認する
```
2017-11-01T05:43:40.338900Z 1 [Note] A temporary password is generated for root@localhost: aaaaaaaaaaaaaaaaaaaaaaa
```


rootパスワードを変更する。 
とりあえずログインして変更しちゃうけど、本当はmysql_secure_installationでやるのが良いらしい…。 
```sql
$ mysql -u root -p
Enter password: [aaaaaaaaaaaaaaaaaaaaaaaを入力]
mysql> SET PASSWORD = PASSWORD('newpassword') ;
ERROR 1819 (HY000): Your password does not satisfy the current policy requirements
```


怒られたのでポリシーを変更する。 
とりあえず適当な文字列でパスワードを変更する。 
```shell
mysql> set password = password('aaaaaaaaaaaaaaaaaaaaaaaabbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb');
Query OK, 0 rows affected, 1 warning (0.00 sec)
```


ポリシーを確認する
```sql
mysql> SHOW VARIABLES LIKE 'validate_password%'; # 再度パスワードの設定を確認
+--------------------------------------+--------+
| Variable_name                        | Value  |
+--------------------------------------+--------+
| validate_password_check_user_name    | OFF    |
| validate_password_dictionary_file    |        |
| validate_password_length             | 8      |
| validate_password_mixed_case_count   | 1      |
| validate_password_number_count       | 1      |
| validate_password_policy             | MEDIUM |
| validate_password_special_char_count | 1      |
+--------------------------------------+--------+
7 rows in set (0.00 sec)
```


validate_password_policy=LOWにする

```sql
mysql> SET GLOBAL validate_password_policy=LOW;
mysql> SHOW VARIABLES LIKE 'validate_password%';
+--------------------------------------+-------+
| Variable_name                        | Value |
+--------------------------------------+-------+
| validate_password_check_user_name    | OFF   |
| validate_password_dictionary_file    |       |
| validate_password_length             | 8     |
| validate_password_mixed_case_count   | 1     |
| validate_password_number_count       | 1     |
| validate_password_policy             | LOW   |
| validate_password_special_char_count | 1     |
+--------------------------------------+-------+

```


パスワードを変更する
```sql
mysql> set password=password('new_pass');
Query OK, 0 rows affected, 1 warning (0.00 sec)

```


SELECT権限のみのユーザ作成
```sql
mysql> create user readonly@'localhost' IDENTIFIED BY 'pass' ;
Query OK, 0 rows affected (0.00 sec)

mysql> GRANT  SELECT ON mysql.* TO readonly@'localhost' IDENTIFIED BY 'pass' ;
Query OK, 0 rows affected, 1 warning (0.00 sec)
```





### link

* http://vdeep.net/centos7-mysql
* https://qiita.com/RyochanUedasan/items/9a49309019475536d22a#%E5%95%8F%E9%A1%8C


