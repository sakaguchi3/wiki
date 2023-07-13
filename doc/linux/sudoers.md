# sudoers

## 編集用エディタ起動

```bash
visudo
```

## 構文

```sudoers
(user|group) (host) = (user)  (command)
```

## 編集

グループtestgrp1に対してhttpdの起動を許可する。
httpd以外は禁止する。

```sudoers
Cmnd_Alias NG_CMD = /bin/systemctl
Cmnd_Alias WEB_CMD = /bin/systemctl * httpd
%testgrp1 ALL=(root) WEB_CMD, !NG_CMD
```

ユーザtestuser1で再起動を許可する。

```sudoers
testuser1 ALL=(root) /sbin/reboot
```

## テスト

実際にテストしてみる。
エラーが出なければOK。

```bash
sudo systemctl reload httpd
(OK)
```

sudoができるコマンドを確認する

```bash
sudo -l -U <user>
```
