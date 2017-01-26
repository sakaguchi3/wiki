# sshは鍵認証のみに制限する

* hogehogeuserは鍵認証
* rootはssh禁止

```sshd_config
Match user hogehogeuser
        PasswordAuthentication  no
        PubkeyAuthentication  yes
Match user root
        PasswordAuthentication  no
        PubkeyAuthentication  no
```