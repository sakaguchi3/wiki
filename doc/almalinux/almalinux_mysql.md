# AlmaLinux8.0 - mysql clientのインストール

8.0を指定してインストールする
```
dnf install @mysql:8.0
```

loginできるか確認
```
mysql -h172.180.0.90 -P3306 -uroot -Droot -p --password=root_password
```
