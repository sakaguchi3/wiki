# sshdをアカウントごとにIPアドレスで制限をする

## 編集するファイル

*    /etc/security/sshd_access.conf
*    /etc/pam.d/sshd
*    /etc/ssh/sshd_config

## /etc/security/sshd_access.conf
以下のファイルを新規作成する。
```bash
$vim /etc/security/sshd_access.conf
```

アクセス制限内容を定義する。
* nolimituser: 制限なし
* limituser: localからのみ接続可
```
# Allow
+ : nolimituser : ALL
# Limit
- : limituser : ALL EXCEPT 192.168.0.0/16 network
```



## /etc/pam.d/sshd
```bash
$vim /etc/pam.d/sshd
```
以下を末尾に付け足す
```
session    required     pam_access.so   accessfile=/etc/security/sshd_access.conf

```



##  /etc/ssh/sshd_config
```bash
$vim  /etc/ssh/sshd_config
```
```sshd_config
UsePAM yes
```

## sshdを再起動
```bash
$ sudo systemctl restart sshd
```











## link
* http://kazmax.zpp.jp/linux/lin_pam.html
