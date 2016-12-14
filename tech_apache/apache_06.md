# Centoos7 redmine 3.4 に slack プラグインをインストールする


## redmine側の設定

redmineのインストール先ディレクトリまで移動して、plulginのDL。
```sh
$ cd /var/www/redmine.server.domain/redmine
$ git clone https://github.com/sciyoshi/redmine-slack.git redmine_slack
```


インストールを実行するが以下のように怒られてしまった。
```
user@server:0:% sudo /usr/local/bin/rake  redmine:plugins:migrate RAILS_ENV=production
(in /var/www/redmine.server.domain/redmine)
Could not find gem 'httpclient' in any of the gem sources listed in your Gemfile.
```

足りないソース（？）をinstallする
```
user@server:0:% bundle install
```




インストールしてみるがまた怒られる
```
user@server:0:% sudo rake redmine:plugins:migrate RAILS_ENV=production
(in /var/www/redmine.server.domain/redmine)
rake aborted!
Gem::LoadError: You have already activated rake 12.0.0, but your Gemfile requires rake 12.2.1. Prepending `bundle exec` to your command may solve this.
```




helpに従いbundle execを実行するが、developがコンフィグレーションされてないみたいなメッセージが出る。
```
user@server:128:% sudo /usr/local/bin/bundle exec rake  db:migrate
(in /var/www/redmine.server.domain/redmine)
rake aborted!
ActiveRecord::AdapterNotSpecified: 'development' database is not configured. Available: ["production"]
```

productionを指定してインストールする。
```
user@server:0:% sudo /usr/local/bin/bundle exec rake  db:migrate RAILS_ENV=production
(in /var/www/redmine.server.domain/redmine)
```



エラーが出なくなったので成功っぽい。
apacheを再起動する.

```
sudo systemctl restart httpd
```



redmineのプラグインページにslackがインストールされている。


![redmine.PNG](/tech_apache/file/apache_06/01.PNG)













## slack側の設定

slack apiにアクセスする。    
https://api.slack.com/    

incomming webhooks をクリック。    




![slack1.PNG](/tech_apache/file/apache_06/02.PNG)


incomming webhook integration をクリック。


![slack2.PNG](/tech_apache/file/apache_06/03.PNG)




post to channelで投稿先のチャンネルを選択する。




![slack3.PNG](/tech_apache/file/apache_06/04.PNG)




webhook ulr のアドレスをコピーする。





![slack4.PNG](/tech_apache/file/apache_06/05.PNG)



redmineにアクセス。



![slack5.PNG](/tech_apache/file/apache_06/06.PNG)



redmine slack -> 設定 →  slack urlに先程のアドレスを貼り付ける。




![slack6.PNG](/tech_apache/file/apache_06/07.PNG)





## 参考
* https://liginc.co.jp/web/programming/other-programming/97710
* https://qiita.com/amateurgrammer/items/1585fa43ea490d235df5
* https://qiita.com/jnchito/items/44ab1df134369ed76911





