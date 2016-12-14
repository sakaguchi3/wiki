#ログインシェルを変更する

## 変更可能なシェルの確認
```shell
$ cat  /etc/shells
/bin/sh
/bin/bash
/sbin/nologin
/usr/bin/sh
/usr/bin/bash
/usr/sbin/nologin
/bin/tcsh
/bin/csh
/bin/zsh
```
## シェル変更
```shell
$ chsh -s /bin/zsh
Changing shell for hogefugapiyouser.
Password:
Shell changed.
```