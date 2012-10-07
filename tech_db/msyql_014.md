# mysql8でパスワードの変更

## userの確認

```mysql
use mysql;
select * from user
```

## パスワードの変更
```mysql
ALTER USER 'root'@'%' IDENTIFIED BY 'new_password'
```
