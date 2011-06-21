# AlmaLinux8.0 - 特定のプロセスだけsudoを許可したい

[ユーザを作成](almalinux_add_usr.md)する。
設定ファイルを開く。
```
visudo
```

tomcat, nginxの権限名を与える。
```
Cmnd_Alias SERVICES_TOMCAT = /usr/bin/systemctl * tomcat*
Cmnd_Alias SERVICES_NGINX = /usr/bin/systemctl * nginx*
```

```
visudo -f /etc/sudoers.d/usr
```

```
usr ALL=(ALL) SERVICES_TOMCAT
usr ALL=(ALL) SERVICES_NGINX
```

警告が出るけど大丈夫
```
Warning: /etc/sudoers.d/usr:1 Cmnd_Alias "SERVICES_TOMCAT" referenced but not defined
Warning: /etc/sudoers.d/usr:2 Cmnd_Alias "SERVICES_NGINX" referenced but not defined
```

確認してみる
```
su usr
sudo systemctl restart tomcat
```
