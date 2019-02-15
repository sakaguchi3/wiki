# MySQL - ubuntu18.04にMySQL5.7をセットアップした時のメモ



### インストール

```bash
$ sudo apt install mysql-server mysql-client
```

### 起動

```bash
$ sudo service mysql start
$ sudo service mysql status
```


### 初期設定

```bash
 $ sudo mysql_secure_installation       // sudoじゃないとエラー起きる

// (略)

Please enter 0 = LOW, 1 = MEDIUM and 2 = STRONG: 0  // パスワードレベルをLOWにしておく    
Please set the password for root here.

New password: 
Re-enter new password:      

// (略) あとは全部yでOK

All done!
```

全部YesでOK



### rootで接続

```bash
$ sudo mysql -u root -p // sudoつけないとNG
```

mysqlへrootログインする際はsudoつけないとエラー起きるらしいでんな．sudoつけなくする方法あるらしい．  

https://askubuntu.com/questions/992771/mysql-u-root-doesnt-work-but-sudo-mysql-u-root-does-why/1038540

### db作成

```mysql
mysql> create   database   memoapp_db character set utf8 ;
```


### user作成

```mysql
mysql> SET GLOBAL validate_password_length=1;
mysql> SET GLOBAL validate_password_policy=LOW;

mysql> SHOW VARIABLES LIKE 'validate_password%';
+--------------------------------------+-------+
| Variable_name                        | Value |
+--------------------------------------+-------+
| validate_password_check_user_name    | OFF   |
| validate_password_dictionary_file    |       |
| validate_password_length             | 4     // 短くしておく(1に出来なかったので最小値が4？)
| validate_password_mixed_case_count   | 1     |
| validate_password_number_count       | 1     |
| validate_password_policy             | LOW   // LOWにしておく
| validate_password_special_char_count | 1     |
+--------------------------------------+-------+
```

これ設定しておかないとcreate userする際にパスワードが脆弱だと```ERROR 1819 (HY000): Your password does not satisfy the current policy requirements```がでる。

```mysql-psql
mysql> create user  dbuser@'192.168.%.%'  identified by 'aaaa' ;
mysql> grant all on  memoapp_db.* to 'dbuser'@'192.168.%.%'  identified by 'aaaa'  with grant option ;
mysql> flush privileges ;

```

### dbuserでリモートからの接続設定


```bash
$ sudo vim /etc/mysql/mysql.conf.d/mysqld.cnf
```

```mysqld.cnf
#bind-address = 127.0.0.1
```

接続制限をコメントアウトしておく．  
コレを設定しておかないと、```mysql -u dbuser -p -h vagrant.localdomain``` したときに ```ERROR 1698 (28000): Access denied for user 'root'@'localhost'```でコケる．


```bash
$ sudo service mysql restart
```  

設定を反映するために再起動



```bash
% mysql -u dbuser -p -h ushi.localdomain
```


### link

* https://askubuntu.com/questions/992771/mysql-u-root-doesnt-work-but-sudo-mysql-u-root-does-why/1038540
* https://qiita.com/RyochanUedasan/items/9a49309019475536d22a
* https://qiita.com/RyochanUedasan/items/9a49309019475536d22a
* https://qiita.com/keisukeYamagishi/items/d897e5c52fe9fd8d9273
