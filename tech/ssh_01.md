# [linux]ssh port番号変更

## 設定環境
OS: Centos7
環境: さくらVPS

## 設定順序
* selinuxにポリシー追加
* sshd_configの設定
* firewalldのポート開放


## selinuxの設定

### semanageインストール

パッケージを探す
```shell
linuxusr@server:1:% yum provides /usr/sbin/semanage
Loaded plugins: fastestmirror
Determining fastest mirrors
 * base: www.ftp.ne.jp
 * extras: www.ftp.ne.jp
 * updates: www.ftp.ne.jp
policycoreutils-python-2.5-17.1.el7.x86_64 : SELinux policy core python utilities
Repo        : base
Matched from:
Filename    : /usr/sbin/semanage
```




インストール
```shell
$sudo yum  install policycoreutils-python-2.5-17.1.el7.x86_64
```





### selinuxのポリシーで設定されているsshdポートを確認
```shell
linuxusr@server:1:% sudo semanage port -l | grep ssh
ssh_port_t                     tcp      22
```


### selinuxのポリシーに新しいポート番号を追加する
```shell
linuxusr@server:0:% sudo semanage port --add --type ssh_port_t --proto tcp 55555
linuxusr@server:0:% sudo semanage port -l | grep ssh
ssh_port_t                     tcp      55555, 22
```






## sshdの設定
vim /etc/ssh/sshd_config
```sshd_config
Port 55555
```


問題ないかテストする
```shell
linuxusr@server:0:% sudo sshd -t
```


### (脇道)SELinuxの設定をしていないと怒られるので、先にSELinuxを設定する必要がある

設定反映しようとすると怒られる
```shell
linuxusr@server:0:% sudo systemctl restart sshd
Job for sshd.service failed because the control process exited with error code. See "systemctl status sshd.service" and "journalctl -xe" for details.
```


エラー内容をみてみると、selinuxのほうのポートを設定してあげないとダメらしいので、SELinuxの設定をする。
```shell
linuxusr@server:1:% sudo systemctl status sshd.service
● sshd.service - OpenSSH server daemon
   Loaded: loaded (/usr/lib/systemd/system/sshd.service; enabled; vendor preset: enabled)
   Active: activating (auto-restart) (Result: exit-code) since Wed 2017-11-01 13:45:17 JST; 10s ago
     Docs: man:sshd(8)
           man:sshd_config(5)
  Process: 2127 ExecStart=/usr/sbin/sshd -D $OPTIONS (code=exited, status=255)
 Main PID: 2127 (code=exited, status=255)

Nov 01 13:45:17 server.localdomain systemd[1]: sshd.service: main process exited, code=exited, status=255/n/a
Nov 01 13:45:17 server.localdomain systemd[1]: Failed to start OpenSSH server daemon.
Nov 01 13:45:17 server.localdomain systemd[1]: Unit sshd.service entered failed state.
Nov 01 13:45:17 server.localdomain systemd[1]: sshd.service failed.
```





## firewallの設定


設定ファイルコピー
```shell
$cd /usr/lib/firewalld/services
$sudo cp ssh.xml ssh-55555.xml

```
ポート番号を変更する
vim ssh-55555.xml
```xml
  <port protocol="tcp" port="55555"/>
```


ルールを永続化する。これをやらないとOS再起動したときにポートをパケット通過できなくてSSHログインが一生できなくなる。
```shell
linuxusr@server:0:% sudo firewall-cmd --add-service=ssh-55555  --zone=public   --permanent
success
linuxusr@server:0:% sudo firewall-cmd --reload
success
```



設定が反映されているか確認する
```shell
linuxusr@server:253:% sudo firewall-cmd --list-all
public (active)
  target: default
  icmp-block-inversion: no
  interfaces: eth0
  sources:
  services: ssh dhcpv6-client ssh-55555
  (略)
```


22番ポートは閉じておく
```shell
linuxusr@server:0:% sudo firewall-cmd --remove-service=ssh --permanent
linuxusr@server:0:% sudo firewall-cmd --reload
success
linuxusr@server:0:%  sudo firewall-cmd --list-all
public (active)
  services: dhcpv6-client ssh-55555 
  // sshがなくなっているのを確認する
success
```





## 参考

https://weblabo.oscasierra.net/openssh-sshd-centos7-change-port/
http://lovepeers.org/2014/11/21/centos7-sshd/

