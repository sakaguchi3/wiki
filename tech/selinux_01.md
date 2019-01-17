# selinux環境下でredmineを動かす


## TL;DR
SELinuxが入っているとredmineが動かなかったので、コネていかないといけない


## やりかた

以下を参考にしてセットアップをする。
* https://cf-docs.jp-east-1.paas.cloud.global.fujitsu.com/ja/manual/tut-dev/tut-dev/topics/t-dev-vm-install-redmine-selinux.html
* http://seeku.hateblo.jp/entry/2013/05/31/093124


SELinuxのステータスを確認します。
```
# getenforce
```


#### passengerディレクトリ

ディレクトリの場所を探す。
```
passenger-config --root
/usr/local/lib/ruby/gems/2.4.0/gems/passenger-5.1.11
```


権限を変更する
```
 chcon -R -h -t httpd_sys_content_t  /usr/local/lib/ruby/gems/2.4.0/gems/passenger-5.1.11
```




#### redmine配置 ディレクトリ
```
chcon -R -h -t httpd_sys_content_t  /var/www/redmine.example.com/redmine
```




#### ポリシーモジュールの管理に必要になるパッケージをインストール
```
# yum install policycoreutils-python
```



#### 古いログを削除

```
# rm /var/log/audit/audit.log
# service auditd restart

```


#### SELinuxをPermissiveモードに設定
```
# setenforce 0
# service httpd restart
```


#### 監視ログからポリシーモジュールを作成
```
# grep httpd /var/log/audit/audit.log | audit2allow -M passenger
# semodule -i passenger.pp
```


#### SELinuxをEnforcedモードに戻す
```
# setenforce 1
# service httpd restart
```


動作すればOK。









