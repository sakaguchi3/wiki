# Let's Encrypt手動更新手順



letsencrypt 更新シェルでrenewを実行する
```bash
$sudo /usr/bin/certbot-auto renew  --post-hook "sudo systemctl reload apache2"

Saving debug log to /var/log/letsencrypt/letsencrypt.log

-------------------------------------------------------------------------------
Processing /etc/letsencrypt/renewal/redmine.example.com.conf
-------------------------------------------------------------------------------
Cert is due for renewal, auto-renewing...
Plugins selected: Authenticator webroot, Installer None
Renewing an existing certificate
Performing the following challenges:
http-01 challenge for redmine.example.com
Waiting for verification...
Cleaning up challenges

-------------------------------------------------------------------------------
new certificate deployed without reload, fullchain is
/etc/letsencrypt/live/redmine.example.com/fullchain.pem
-------------------------------------------------------------------------------
Plugins selected: Authenticator webroot, Installer None

-------------------------------------------------------------------------------
Processing /etc/letsencrypt/renewal/crowi.example.com.conf
-------------------------------------------------------------------------------
Cert not yet due for renewal
Plugins selected: Authenticator standalone, Installer None

-------------------------------------------------------------------------------

The following certs are not due for renewal yet:
  /etc/letsencrypt/live/crowi.example.com/fullchain.pem expires on 2018-09-13 (skipped)
Congratulations, all renewals succeeded. The following certs have been renewed:
  /etc/letsencrypt/live/redmine.example.com/fullchain.pem (success)
-------------------------------------------------------------------------------
Running post-hook command: sudo service httpd restart
Hook command "sudo service httpd restart" returned error code 5
Error output from sudo:
Failed to restart httpd.service: Unit httpd.service not found.
```

sudo service httpd restart が実行できないってエラーが出る。 
apacheを手動で再起動する。

```bash
 % sudo systemctl restart apache2
```


※hookを以下のように設定したので，もしかしたら今後はエラーは出ないかもしれない．
```bash
 sudo /usr/bin/certbot-auto renew  --post-hook "sudo systemctl reload apache2"
```
