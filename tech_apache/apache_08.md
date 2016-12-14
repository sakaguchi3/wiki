# Centos7にcrowi-plusをセットアップ





node6.x の repository 追加。

```
  curl -sL https://rpm.nodesource.com/setup_6.x | sudo bash -
```





nodejsをインストール
```
% sudo yum install nodejs gcc-c++ make
```



nodejsのバージョンを確認。
```
usr@server:0:% node -v
```





## MongoDBのインストール

公式のマニュアルを参考にセットアップする。
https://docs.mongodb.com/manual/tutorial/install-mongodb-on-red-hat/#install-mongodb-community-edition


 /etc/yum.repos.d/mongodb-org-3.4.repoを作成する。
以下を書き足す。
```
[mongodb-org-3.4]
name=MongoDB Repository
baseurl=https://repo.mongodb.org/yum/redhat/$releasever/mongodb-org/3.4/x86_64/
gpgcheck=1
enabled=1
gpgkey=https://www.mongodb.org/static/pgp/server-3.4.asc
```


インストール
```
sudo yum install -y mongodb-org
```



selinuxの設定
```
usr@server:0:% sudo  semanage port -a -t mongod_port_t -p tcp 27017
```



mongo db 開始
```
sudo service mongod start
```


os再起動時に自動的に起動するプロセスとして登録。
```
usr@server:0:% sudo systemctl enable mongod
```





#### ユーザ作成をする

mongodbに接続する

```shell
$ mongo
```


バージョン確認する
```mongo
> db.version()
3.4.10
```




crowi用DBを作成する。
crowi用ユーザを作成する。(pwdやuserは環境に合わせて適切に設定する)
```
> use crowidb
switched to db crowidb
> db.createUser({user: "crowi", pwd: "aaaaaaaaaaaaaaaaaaaa", roles: [{role: "readWrite", db: "crowidb"}]})
Successfully added user: {
        "user" : "crowi",
        "roles" : [
                {
                        "role" : "readWrite",
                        "db" : "crowidb"
                }
        ]
}

```





## yarnのインストール
```
# wget https://dl.yarnpkg.com/rpm/yarn.repo -O /etc/yum.repos.d/yarn.repo
# yum install yarn
```




## crowiのインストール



/var/www/crowi.example.com/crowi-plus にインストール

```
$ cd /var/www/crowi.example.com/crowi-plus
$ sudo git clone https://github.com/weseek/crowi-plus.git
```




プラグインのインストール
```
$ cd /var/www/crowi.example.com/crowi-plus
$ sudo npm install --save crowi-plugin-lsx
$ sudo npm install --save crowi-plugin-pukiwiki-like-linker
$ sudo yarn
```




構築・動作確認
```
$ sudo npm start
```




## crowiの自動起動設定


/var/www/crowi.example.com/crowi-plus/crowi-plus
に以下を記述してアップロードの設定をする。

```
FILE_UPLOAD=local
```

スクリプト作成

```
usr@server:0:% sudo npm install -g forever initd-forever log
usr@server:0:% sudo initd-forever -n crowi-plus
usr@server:0:% chmod +x crowi-plus
```

少し編集
```
- nodeApp="/var/www/github/crowi-plus/"
+ nodeApp="/var/www/github/crowi-plus/app.js"

- $foreverApp start --pidFile $pidFile -l $logFile -a -d -c "$command" $nodeApp
+ FILE_UPLOAD=local MONGO_URI=mongodb://localhost/crowi $foreverApp start --pidFile $pidFile -l $logFile -a -d -c "$command" $nodeApp
```





起動スクリプト登録
```
usr@server:0:% sudo mv crowi-plus /etc/init.d
usr@server:0:% sudo chkconfig crowi-plus --add
usr@server:0:% sudo chkconfig crowi-plus on
usr@server:0:% sudo chkconfig
```




## apacheの設定


80ポートに来たものをnpmにproxyするように設定する
```apache
<VirtualHost *:80>
        ServerAdmin mail@example.com
        ServerName crowi-server.server.example.com

        ErrorLog logs/crowi_error.log
        CustomLog logs/crowi_access.log combined

        <LocationMatch "/">
                 Require all granted
        </LocationMatch>

        PassengerHighPerformance on

        ProxyPass / http://localhost:3000/
        ProxyPassReverse / http://localhost:3000/

</VirtualHost>
```






## 参考
http://d.hatena.ne.jp/akishin999/20161225/1482682979

https://docs.mongodb.com/manual/tutorial/install-mongodb-on-red-hat/#install-mongodb-community-edition
https://weblabo.oscasierra.net/redis-centos7-install-yum/


