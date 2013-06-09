# ssh - sftp only userの作成


## ユーザ作成

```bash
$ sudo adduser sftp-sample 
```

## 鍵の設定

ユーザの切替

```bash
$ sudo su sftp-sample
$ cd ~/ 
```


```bash
$ mkdir .ssh
$ chmod 700 .ssh 

$ touch .ssh/authorized_keys
$ chmod 600 .ssh/authorized_keys 
```

以下を記載

```bash
$ vim ~/.ssh/authorized_keys
```
```~/.ssh/authorized_keys
command="internal-sftp"
```

公開鍵を追記
```bash
$ cat id_ed25519_secret.pub >> authorized_keys
```


## ディレクトリ権限

```bash
$ cd /home/
$ sudo chown root: sftp-sample
$ sudo chmod 755 sftp-sample 
```


## sshd_configの設定

```bash
$ vim /etc/ssh/sshd_config
```

```/etc/ssh/sshd_config
Match User sftp-*
    ForceCommand internal-sftp -u 000
    ChrootDirectory /home/%u
    PasswordAuthentication no
```

sshd_configの文法チェック&restart

```bash
$ sshd -t
$ systemctl restart sshd
```


sftpが接続できて、sshが接続不可になっているかを確認する

```bash
$ sftp -i id_ed25519_secret sftp-sample@remote

$ ssh -i id_ed25519_secret sftp-sample@remote
Could not chdir to home directory /home/sftp-sample: No such file or directory
This service allows sftp connections only.
Connection to 10.33.102.99 closed.
```


