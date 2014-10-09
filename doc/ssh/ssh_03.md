# sshユーザごとに接続ipをコントロールする

ユーザごとにsshを許可するipを設定する。

## 編集するファイル

* `/etc/security/sshd_access.conf`
* `/etc/pam.d/sshd`
* `/etc/ssh/sshd_config`

## /etc/security/sshd_access.conf

ファイルを新規作成。

```bash
vim /etc/security/sshd_access.conf
```

アクセス制限内容を定義する。

* nolimituser: 制限なし

```conf
+ : nolimituser : ALL
```

* limituser: ipアドレスで制限をかける。`192.168.0.0/16`からのみ接続許可。

```conf
- : limituser : ALL EXCEPT 192.168.0.0/16 network
```

または

```conf
+ : limituser : 192.168.0.0/16 network
- : limituser : ALL 
```

## /etc/pam.d/sshd

```bash
vim /etc/pam.d/sshd
```

```conf
session    required     pam_access.so   accessfile=/etc/security/sshd_access.conf
```

## /etc/ssh/sshd_config

```bash
vim  /etc/ssh/sshd_config
```

デフォルトでyesになっているはず。

```sshd_config
UsePAM yes
```

## sshdを再起動

エラーがないかチェック

```bash
sshd -t
```

再起動

```bash
sudo systemctl reload sshd
or
sudo systemctl restart sshd
```

## link

* <http://kazmax.zpp.jp/linux/lin_pam.html>
