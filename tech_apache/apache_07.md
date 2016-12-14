# [linux] CentOS7にredmine3.4をインストールする




## firewallの設定
以下を参考にセットアップをする    
http://blog.redmine.jp/articles/3_4/install/centos/    
```shell
$ firewall-cmd --zone=public --add-service=http --permanent
success
$ firewall-cmd --reload
success

user@server:0:% sudo firewall-cmd --zone=public --list-services
dhcpv6-client ssh-55555 http 
 // httpが追加されて入ればOK
```

## selinuxを無効にする
selinuxを有効にするのは何かと面倒くさいので、まずは無効にして設定を進める。

 /etc/sysconfig/selinux をひらきdisableに設定する。

```
# This file controls the state of SELinux on the system.
# SELINUX= can take one of these three values:
#     enforcing - SELinux security policy is enforced.
#     permissive - SELinux prints warnings instead of enforcing.
#     disabled - No SELinux policy is loaded.
SELINUX=disabled
# SELINUXTYPE= can take one of three two values:
#     targeted - Targeted processes are protected,
#     minimum - Modification of targeted policy. Only selected processes are protected.
#     mls - Multi Level Security protection.
SELINUXTYPE=targeted

```

osを再起動
```
$sudo shutdown -r now
```


selinuxが無効になっておればおｋ。
```
$getenforce
Disabled
```







## DBの設定
先程のページではPostgresSQLを使う設定になっていたが、MySQLで設定したい。
ver3.1にMySQLの設定の仕方が書いてあったのでDBだけこちらの設定方法を参考にしてみる。

http://blog.redmine.jp/articles/3_1/installation_centos/
```sql
mysql> create database redmine_db default character set utf8;
Query OK, 1 row affected (0.01 sec)

mysql> grant all on redmine_db.*  to redmine_usr@localhost identified by '****' ;
Query OK, 0 rows affected, 1 warning (0.00 sec)

mysql> flush privileges;
Query OK, 0 rows affected (0.00 sec)

```






## 必要パッケージのインストール

### 開発ツール(Cコンパイラ等)のインストール
```shell
yum groupinstall "Development Tools"
```




### RubyとPassengerのビルドに必要なヘッダファイルなどのインストール
```shell
yum install openssl-devel readline-devel zlib-devel curl-devel libyaml-devel libffi-devel
```



### Apacheとヘッダファイルのインストール
```shell
yum install httpd httpd-devel
```



### mageMagickとヘッダファイル・日本語フォントのインストール
```shell
yum install ImageMagick ImageMagick-devel ipa-pgothic-fonts
```





## Rubyのインストール
以下を参考にしてインストールする。    
* https://weblabo.oscasierra.net/install-ruby20-to-redhat-1/


### DL

```shell
$ cd /usr/local/src/
$ curl -O https://cache.ruby-lang.org/pub/ruby/2.4/ruby-2.4.2.tar.gz
$ tar xzf ruby-2.4.2.tar.gz
```

### インストール
```shell
$ cd /usr/local/src/ruby-2.4.2
$ sudo ./configure --disable-install-doc
$ sudo make
$ sudo make install
$ cd ..

```

バージョン2.4.xが表示されればインストール成功
```shell
user@server:0:% ruby -v
ruby 2.4.2p198 (2017-09-14 revision 59899) [x86_64-linux]
```


bundleのインストール
```shell
user@server:0:% sudo /usr/local/bin/gem install bundler --no-rdoc --no-ri
Fetching: bundler-1.16.0.gem (100%)
Successfully installed bundler-1.16.0
1 gem installed
```









## redmineのインストール

```shell
user@server:1:% svn co  https://svn.redmine.org/redmine/branches/3.4-stable redmine
Error validating server certificate for 'https://svn.redmine.org:443':
 - The certificate is not issued by a trusted authority. Use the
   fingerprint to validate the certificate manually!
Certificate information:
 - Hostname: svn.redmine.org
 - Valid: from Sun, 08 Jan 2017 00:00:00 GMT until Wed, 08 Jan 2020 23:59:59 GMT
 - Issuer: Gandi, Paris, Paris, FR
 - Fingerprint: xxxx
(R)eject, accept (t)emporarily or accept (p)ermanently? p
```




DBの接続設定をする
/var/www/redmine.example.com/redmine/config/database.yml
```
production:
  adapter: mysql2
  database: redmine
  host: localhost
  port: 3306
  username: redmine_usr
  password: ****
  encoding: utf8
```



メールの設定
/var/www/redmine.example.com/redmine/config/configuration.yml
```
production:
    email_delivery:
        delivery_method: smtp
        smtp_settings:
            address: "localhost"
            port: 25
            domain: "mail.example.com"
    rmagick_font_path: /usr/share/fonts/ipa-pgothic/ipagp.ttf
```



gemパッケージのインストール
```shell
bundle install --without development test --path vendor/bundle

An error occurred while installing mysql2 (0.4.9), and Bundler cannot continue.
Make sure that `gem install mysql2 -v '0.4.9'` succeeds before bundling.

In Gemfile:
  mysql2
user@server:5:% gem install mysql2 -v '0.4.9'
Fetching: mysql2-0.4.9.gem (100%)
ERROR:  While executing gem ... (Gem::FilePermissionError)
    You don't have write permissions for the /usr/local/lib/ruby/gems/2.4.0 directory.
user@server:0:% sudo /usr/local/bin/gem install mysql2 -v '0.4.9'

user@server:0:% bundle install --without development test    --path vendor/bundle
An error occurred while installing mysql2 (0.4.9), and Bundler cannot continue.
Make sure that `gem install mysql2 -v '0.4.9'` succeeds before bundling.
```

やっぱり怒られる。
mysql-develをいれる。
```shell
user@server:1:% sudo yum install mysql-devel
```


## rdmineの初期設定

セッション改ざん防止用秘密鍵の作成
```
bundle exec rake generate_secret_token
```




データベースのテーブル作成

```
RAILS_ENV=production bundle exec rake db:migrate
```




デフォルトデータの登録

```
RAILS_ENV=production REDMINE_LANG=ja bundle exec rake redmine:load_default_data

```







## apacheの設定
passenger インストール

```
% sudo /usr/local/bin/gem install passenger --no-rdoc --no-ri
```

PassengerのApache用モジュールのインストール

```
sudo /usr/local/bin/passenger-install-apache2-module --auto --languages ruby

```


Apache用設定内容の確認
```
user@server:0:% sudo /usr/local/bin/passenger-install-apache2-module --snippet
LoadModule passenger_module /usr/local/lib/ruby/gems/2.4.0/gems/passenger-5.1.11/buildout/apache2/mod_passenger.so
<IfModule mod_passenger.c>
  PassengerRoot /usr/local/lib/ruby/gems/2.4.0/gems/passenger-5.1.11
  PassengerDefaultRuby /usr/local/bin/ruby
</IfModule>
```


virtualhostファイルの設定をする。
/etc/httpd/conf.d/redmine.confを作成して以下を記述する。

```apache
<Directory "/var/www/redmine.example.com/redmine/public">
        AllowOverride ALL
</Directory>

LoadModule passenger_module /usr/local/lib/ruby/gems/2.4.0/gems/passenger-5.1.11/buildout/apache2/mod_passenger.so
<IfModule mod_passenger.c>
  PassengerRoot /usr/local/lib/ruby/gems/2.4.0/gems/passenger-5.1.11
  PassengerDefaultRuby /usr/local/bin/ruby
</IfModule>


<VirtualHost *:80>
        DirectoryIndex  index.html index.php
        ServerAdmin server@example.com
        DocumentRoot /var/www/redmine.example.com/redmine/public
        ServerName redmine.example.com

        ErrorLog logs/redmine_error_log
        CustomLog logs/redmine combined env=!no_log

        <LocationMatch "/">
                 Require all granted
        </LocationMatch>
</VirtualHost>
```




## SELinux環境下で動かすように設定する


* [selinux環境下でredmineを動かす](/tech/selinux_01.md)

結構面倒くさいです…。







