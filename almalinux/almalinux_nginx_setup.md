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

## tomcatとの連携

ここではvirtual hostsごとにファイルで分割して設定する例をあげる。
[virtual hostsの設定](almalinux_nginx_virtualhost.md)参照。

```
cd /etc/nginx
vim sites-available/tomcat.com
```

```
server {
    listen       80;
    server_name tocat.com;
    access_log  /var/log/nginx/tocat.com.access.log;
    error_log  /var/log/nginx/tocat.com.error.log;
    root   /var/www/html/tomcat.com;
   
    location  /  {
            # proxy pass header
            proxy_set_header Host $host;
            proxy_set_header X-Real-IP $remote_addr;
            proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for; 
            
            proxy_next_upstream error timeout http_500 http_502 http_503 http_504 non_idempotent;
            
            proxy_pass http://localhost:8080/;
    }
}
```

## fwの設定

``` 
firewall-cmd --list-services --zone=public

firewall-cmd --add-service=http --permanent
firewall-cmd --add-service=https --permanent

firewall-cmd --reload
```
