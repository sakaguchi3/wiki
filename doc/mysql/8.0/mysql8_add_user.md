# MySQL8.0 - userに権限を設定

### 権限を追加する

'user'というユーザを作成する

```mysql
CREATE USER user IDENTIFIED BY 'passwd'
```

ユーザが追加されたかを確認する

```mysql
SELECT * FROM mysql.user;
SHOW GRANTS FOR user@'%'
```

dbを作成

```mysql
CREATE DATABASE testdb;
```

権限を追加する

```mysql
GRANT ALL PRIVILEGES ON testdb.* TO 'user'@'%' WITH GRANT OPTION;
FLUSH PRIVILEGES;
```

### 権限を削除する

特定の権限を削除

```mysql
REVOKE CREATE ON testdb.* FROM 'user'@'%';
FLUSH PRIVILEGES;

SHOW GRANTS FOR user@'%'
```

すべての権限を削除

```mysql
REVOKE ALL, GRANT OPTION FROM 'user'@'%';
FLUSH PRIVILEGES;

SHOW GRANTS FOR user@'%'
```
