# apache - crowi plusのセットアップ


# 必要ライブラリのインストール

### npm, nodejsのインストール
```bash
sudo apt install nodejs npm
```

### npmを使い n package を入れる
```bash
sudo npm cache clean
sudo npm install n -g
```
### n package を使い node をインストール
```bash
sudo n stable
sudo ln -sf /usr/local/bin/node /usr/bin/node
```
### 最初に入れたnodejs, npmは古いのでアンインストール
```bash
sudo apt purge -y nodejs npm
sudo apt autoremove -y
```
### 最新versionかを確認
```bash
$node -v
v8.0.0
$npm -v
5.0.0
```
###安定バージョンに変更する(ダウングレード)
```bash
$ sudo n 6.11.0
$ node -v
v6.11.0
$ npm -v
3.10.10
```

### npmでyarnをインストール
```bash
$ sudo npm instasll -g yarn
```

### mongodbをインストール
```bash
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv aaaaaaaaaaaaaaaaaaa
echo "deb [ arch=amd64,arm64 ] http://repo.mongodb.org/apt/ubuntu xenial/mongodb-org/3.4 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-3.4.list
sudo apt install -y mongodb-org
```
https://docs.mongodb.com/manual/tutorial/install-mongodb-on-ubuntu/

### mongodbにユーザの登録(これは必要ないかも)
```
$ mongo
> use nekodb
> db.createUser({user: "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaa", pwd: "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaa", roles: [{role: "readWrite", db: "nekodb"}]})
```
一応ユーザがちゃんとできてるか確認します
```mongodb
> use admin
switched to db admin
> db.system.users.find()
{ "_id" : "DBNAME.USERNAME", "user" : "USERNAME", "db" : "DBNAME", ～中略～ "roles" : [ { "role" : "readWrite", "db" : "DBNAME" } ] }
> exit
```

### mongodbのdaemon
```bash
sudo vim /etc/systemd/system/mongodb.service
```
以下の内容を記述
```
[Unit]
Description=High-performance, schema-free document-oriented database
After=network.target

[Service]
User=mongodb
ExecStart=/usr/bin/mongod --quiet --config /etc/mongod.conf

[Install]
WantedBy=multi-user.target
```
daemonで動かす設定
```bash
$ sudo systemctl start mongodb
$ sudo systemctl enable mongodb
```

# crowi-plus

/var/www/crowi.example.com にインストール

```bash
$ cd /var/www/crowi.example.com/
$ sudo git clone https://github.com/weseek/crowi-plus.git
```

### プラグインのインストール
```bash
$ cd /var/www/crowi.example.com/crowi-plus
$ sudo npm install --save crowi-plugin-lsx
$ sudo npm install --save crowi-plugin-pukiwiki-like-linker
```

### 追加パッケージのインストール
```bash
hoge@hoge: /var/www/crowi.example.com/crowi-plus$ sudo yarn
```

### 構築・動作確認
```
hoge@hage:/var/www/crowi.example.com/crowi-plus$ sudo npm start
```
C-cで終了


# 自動起動の設定

### 環境変数ファイル crowi-plus を作成
```bash
$ cd /var/www/crowi.example.com/crowi-plus
$ sudo vim crowi-plus
```

以下の内容を設定
```
FILE_UPLOAD=local
```

起動用に crowi-plus.sh を作成
```bash
$ cd /var/www/crowi.example.com/crowi-plus
$ sudo vim crowi-plus.sh
```

以下の内容を設定
```bash
#! /bin/sh

cd /var/www/crowi.example.com/crowi-plus
npm run server:prod
```


## 自動起動の為に crowi-plus.service を作成
```bash
$ cd /var/www/crowi.example.com/crowi-plus
$ sudo vim /etc/systemd/system/crowi-plus.service
```

## 以下の内容を設定
```
[Unit]
Description=Crowi - The Simple & Powerful Communication Tool Based on Wiki
After=network.target mongod.service

[Service]
WorkingDirectory=/var/www/crowi.example.com/crowi-plus
EnvironmentFile=/var/www/crowi.example.com/crowi-plus/crowi-plus
ExecStart=/bin/bash /var/www/crowi.example.com/crowi-plus.sh

[Install]
WantedBy=multi-user.target
```

## 起動設定
```bash
$ sudo systemctl enable crowi-plus
```

# apache の設定

nodejsは3000ポートで起動する。
80番リクエストでアクセスできるように設定する。
apache->nodejsにproxyするように設定する。

```bash
$ cd /etc/apache2/sites-available
$ vim crowi.example.com.conf
```
以下を記述する
```apache
# ----------------------------------------------------------------------------------------------------
# http
# ----------------------------------------------------------------------------------------------------
<VirtualHost *:80>
        Include ./sites-available/crowi.example.com.conf_common

        <IfModule mod_rewrite.c>
            RewriteEngine on
            RewriteCond %{HTTPS} off
            RewriteRule ^(.*)$ https://%{HTTP_HOST}%{REQUEST_URI} [R,L]
        </IfModule>
</VirtualHost>

# ----------------------------------------------------------------------------------------------------
# https
# ----------------------------------------------------------------------------------------------------
<VirtualHost *:443>
        SSLEngine on
        SSLProtocol all -ALL -SSLv2 -SSLv3 +TLSv1 +TLSv1.1 +TLSv1.2
        SSLCipherSuite ECDH+AESGCM:DH+AESGCM:ECDH+AES256:DH+AES256:ECDH+AES128:DH+AES:RSA+AESGCM:RSA+AES:!EXP:!LOW:!aNULL:!eNULL:!ADH:!DSS:!MD5:!PSK:!SRP:!RC4:!3DES
        SSLHonorCipherOrder on

        SSLCertificateFile /xxx/fullchain_20170907
        SSLCertificateKeyFile /xxx/privkey_20170907

        Include ./sites-available/crowi.example.com.conf_common
</VirtualHost>
```

common用のファイルを作成する。
```bash
$ vim crowi.example.com.conf_common
```
以下を記述する。

```apache
        ServerAdmin example@example.com
        ServerName crowi.example.com

        ErrorLog ${APACHE_LOG_DIR}/xxx/xxx_error.log
        CustomLog ${APACHE_LOG_DIR}/xxx/xxx_access.log combined

        <LocationMatch "/">
                Require all granted
        </LocationMatch>

        PassengerHighPerformance on

        ProxyPass / http://localhost:3000/
        ProxyPassReverse / http://localhost:3000/
```
有効化する
```bash
$ sudo a2ensite crowi.example.com.conf
```

## apacheでproxypass関連のモジュールを設定する
```bash
$ sudo a2enmod proxy proxy_http
```

# 参考ページ
* よく見たページ
	* http://qiita.com/q_kwm/items/fc506d3289db2f12d549
	* http://qiita.com/nullsnet/items/a6e69e44087339127b35
*  そのうち見ておきたい
	* http://hico-horiuchi.hateblo.jp/entry/20140702/1404231739
	* http://hogem.hatenablog.com/entry/20091205/1260023908
	* http://d.hatena.ne.jp/ikafly/20120801/1343832477
	* http://qiita.com/Bakudankun/items/740ac8ba1395fe4e40a6



