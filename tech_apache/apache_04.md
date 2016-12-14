# Let's Encrypt自動更新






## cronに追加


```
$ cd /etc/cron.d
$ vim letsencrypt
```


以下を追加する

```
 20 04 * * * root  /usr/bin/certbot-auto renew --post-hook "sudo systemctl reload apache2"
```

URL: https://qiita.com/tmatsumot/items/aca49d99558d2646ef36





## cronにlog出力させる

```bash
$ cd /etc/rsyslog.d
$ vim 50-default.conf
```

以下をコメントアウトする

```conf
cron.*  /var/log/cron.log
```


rsyslogを反映する

```bash
$sudo systemctl restart rsyslog
```


cronのlogの確認

```bash
$ cat /var/log/cron |grep certbot
```



URL: https://tech.withsin.net/2018/03/22/ubuntu-1404-cron/
