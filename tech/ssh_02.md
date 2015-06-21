# ssh - ssh_confを設定

### sshパスワード認証NG（鍵認証のみOK)



```sshd_config
$ vim /etc/ssh/sshd_config
 
# passwd NG
Match user hogehogeuser
        PasswordAuthentication  no
        PubkeyAuthentication  yes
```

変更内容が正しいかチェック

```bash
$ sshd -t
```

リロード

```bash
$ systemctl reload sshd
```


### sshログインNGユーザの設定

```sshd_config
$ vim /etc/ssh/sshd_config

# passwd NG, 鍵認証 NG        
Match User root
        PasswordAuthentication  no
        PubkeyAuthentication  no
```


### sftp-onlyのユーザを追加する


```ssh
$ vim /etc/ssh/sshd_config

Match User sftp-user
      ChrootDirectory /home/%u
      ForceCommand internal-sftp -u 000
      PasswordAuthentication yes
```

```bash
$ sshd -t 
```

