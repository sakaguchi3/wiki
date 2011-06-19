# AlmaLinux8.0 - nginx -  virtual hostごとにファイルを分割する

``` 
cd /etc/nginx
```

sites-available: ここにhostごとに設定ファイルを置く。
sites-enable: availableにあるファイルを有効化する場合は、ここにaliasを作成する。
``` 
mkdir sites-available sites-enable
``` 

``` 
vim nginx.conf
```

``` 
http {
    ....
    # これを追加する
    include /etc/nginx/sites-enable/*;
```

virtual hostの設定
``` 
vim sites-available/test.com
```

``` 
server {
    listen       80;
    server_name test.com;
    access_log  /var/log/nginx/test.com.access.log;
    error_log  /var/log/nginx/test.com.error.log;
    root   /var/www/test.com; 
    
    location  / {
        root   /var/www/test.com;
    }
}
``` 

``` 
ln -s /etc/nginx/sites-available/test.com  /etc/nginx/sites-enable
```

``` 
nginx -t
systemctl restart nginx
```
