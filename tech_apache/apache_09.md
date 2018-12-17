# apache - Set the 'ServerName'のエラーが出る時

vim /var/log/httpd/error_log
```
[Tue Sep 19 20:09:36.396893 2017] [suexec:notice] [pid 27722] AH01232: suEXEC mechanism enabled (wrapper: /usr/sbin/suexec)
AH00558: httpd: Could not reliably determine the server's fully qualified domain name, using hogehogedomain.localdomain. Set the 'ServerName' directive globally to suppress this message
[Tue Sep 19 20:09:36.483877 2017] [auth_digest:notice] [pid 27722] AH01757: generating secret for digest authentication ...
```

hostsファイルにIPを追加する

```bash
# /etc/hosts
127.0.0.2    hogehogedomain.localdomain
```