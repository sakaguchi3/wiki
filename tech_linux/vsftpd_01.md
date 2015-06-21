# FTP - vsftpd@CentOS7


### install

```
yum install  vsftpd
```

### 設定

設定ファイルは `/etc/vsftpd/` の下にある

* `vsftpd.conf`

```
# {user_list}が(black|white)listかを設定する. {user_list}ファイル内に対象のユーザを追加する
userlist_deny=YES`  
```

* `user_list` 
    * `userlist_deny=NO` : このファイル内のuserはallow
    * `userlist_deny=YES`: このファイル内のuserはdeny
```
hogeuser                                                                                                                  
fugauser
piyo-stpuser
```

* `ftpusers`
    * blacklist
```
root
bin
daemon
adm
```


### memo

ftpの認証には{linux_user, linux_passwd}が使われる．
ftp専用のアカウントは作れない．




### command history

```bash
cd /etc/vsftpd
sudo vim vsftpd.conf
sudo systemctl restart vsftpdtp
ps aux| grep vsftpd 
```


