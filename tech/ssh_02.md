# sshは鍵認証のみに制限する


### 鍵認証に制限する

設定ファイル ```/etc/ssh/sshd_config```


```sshd_config
# 鍵認証のみ許可にする
Match user hogehogeuser
        PasswordAuthentication  no
        PubkeyAuthentication  yes
# 鍵もパスワードも両方NG        
Match user root
        PasswordAuthentication  no
        PubkeyAuthentication  no
```

変更内容が正しいかチェック

```bash
$ sshd -t
```

リロード

```bash
$ systemctl reload sshd
```
