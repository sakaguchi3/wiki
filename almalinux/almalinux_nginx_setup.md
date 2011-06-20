# AlmaLinux8.0 - nginx - setup

``` 
dnf install nginx
```

nginxのバージョン情報を表示させない
``` 
cd /etc/nginx
vim nginx.conf
```

``` 
http {
    server_tokens off;
```

``` 
systemctl reload nginx
```

## phpとの連携
``` 
cd /etc/php-fpm.d/
vim www.conf
```

追記する
``` 
group = nginx
listen.owner = nginx
listen.group = nginx
```

``` 
systemctl restart php-fpm
```

## fwの設定

``` 
firewall-cmd --list-services --zone=public

firewall-cmd --add-service=http --permanent
firewall-cmd --add-service=https --permanent

firewall-cmd --reload
```
