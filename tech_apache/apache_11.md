# apache - Let's Encrypt自動更新 @CentOS7 apache2.2



### software

soft
```bash
 git clone https://github.com/certbot/certbot
```

### 証明書作成
 
SSL証明書作成
``` 
  email='メールアドレス'
  domains='ドメインを複数なら,区切りで'
```

```bash
 
 bash ./certbot-auto certonly --standalone --non-interactive --agree-tos \
   --keep --expand --email 'admin@example.com' \
   --no-eff-email --domains 'yourhost.example.com' \
   --pre-hook 'systemctl stop httpd' 
   --post-hook 'systemctl start httpd' \
 \
```

以下に証明書が作成される
```
 /etc/letsencrypt/archive/yourhost.example.com
```

apache

```
$ vim /xxx/apache/conf/extra

  SSLCertificateFile /etc/letsencrypt/live/yourhoust.example.com/cert.pem
  SSLCertificateChainFile /etc/letsencrypt/live/yourhoust.example.com/chain.pem
  SSLCertificateKeyFile /etc/letsencrypt/live/yourhoust.example.com/privkey.pem
```

### 自動更新

renewコマンドが実行できるか手動でテストする 
```
/certbot/certbot-auto renew --post-hook "sudo systemctl reload http"
```

cron設定   
以下にファイルを作成

```
$ touch /etc/cron.weekly/letsencrypt 
$ vim /etc/cron.weekly/letsencrypt

20 04 * * * root  /usr/bin/certbot-auto renew --post-hook "sudo systemctl reload http" 
```