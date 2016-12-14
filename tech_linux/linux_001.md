# Linux - Time Zone変更 

## TL;DR
なんかvagrantのCentOSだと、デフォルトのタイムゾーンがCETになっていたのでJSTに変更した

## やったこと

```bash
[linuxuser@server ~]$ date
Thu Dec 13 17:18:46 CET 2018
```

CentOSのデフォルト設定だとCETになっていた．

```bash
[linuxuser@server ~]$ sudo timedatectl set-timezone Asia/Tokyo
```

JSTに変更する．

```bash
[linuxuser@server ~]$ date
Fri Dec 14 01:20:55 JST 2018
```

正しくJSTに変更された．


```bash
[linuxuser@server ~]$ sudo systemctl restart mysqld
```

MySQLにも反映する．