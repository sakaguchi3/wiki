# apache -Let's Encrypt で「Problem binding to port 80: Could not bind to IPv4 or IPv6.. Skipping.」の対処法




```bash
user@server:~:0:% sudo /usr/bin/certbot-auto renew   --post-hook "sudo systemctl reload apache2"
[sudo] password for <username>:
Saving debug log to /var/log/letsencrypt/letsencrypt.log

- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
Processing /etc/letsencrypt/renewal/hoge.example.com.conf
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
Cert is due for renewal, auto-renewing...
Plugins selected: Authenticator standalone, Installer None
Renewing an existing certificate
Performing the following challenges:
http-01 challenge for hoge.example.com
Cleaning up challenges
Attempting to renew cert (hoge.example.com) from /etc/letsencrypt/renewal/hoge.example.com.conf produced an unexpected error: Problem binding to port 80: Could not bind to IPv4 or IPv6.. Skipping.

- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
Running post-hook command: sudo systemctl reload apache2
1 renew failure(s), 0 parse failure(s)
```


> Problem binding to port 80: Could not bind to IPv4 or IPv6.. Skipping.

が出て更新失敗する．

## 原因(?)

```apache
  ProxyPass / http://localhost:3000/
  ProxyPassReverse / http://localhost:3000/
```

他の VirtualHost だとうまく言ったので，revers proxyをつかっているのが原因かも…？

 
 
## 対応方法

```bash
user@server:0:% sudo systemctl stop apache2
user@server:0:% sudo /usr/bin/certbot-auto renew   --post-hook "sudo systemctl reload apache2"
user@server:0:% sudo systemctl start apache2
```

apacheを停止してから，renewを実行するとエラーが出なくなる．




## 参考

https://mau.tips/archives/839/