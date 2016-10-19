# mongodb - セットアップ ubuntu18.04


### インストール


```bash
sudo apt install mongodb
```


### セットアップ



```bash
vim /etc/mongodb.conf
```

```mongodb
#bind_ip = 127.0.0.1
bind_ip=0.0.0.0
```

リモートからの接続を許可する． 



```bash
sudo service mongodb restart
```

再起動して設定を反映する



### link

* https://www.trifields.jp/how-to-install-mongodb-on-ubuntu-2751
* https://qiita.com/Chanmoro/items/cbf4e451d0a89f4d7c1a
* https://qiita.com/hanaken_Nirvana/items/750982f693db88b44d13
