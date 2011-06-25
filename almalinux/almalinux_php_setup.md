# AlmaLinux8.0 - install php7.4

``` 
dnf install https://rpms.remirepo.net/enterprise/remi-release-8.rpm
```


デフォルトのバージョンを変更する
``` 
dnf module reset php
dnf module enable php:7.4
```

``` 
dnf module install php:remi-7.4 
``` 

apache, nginxとの連携
``` 
dnf install php-fpm 
```

installされたかをチェックする
```
php -v
```
