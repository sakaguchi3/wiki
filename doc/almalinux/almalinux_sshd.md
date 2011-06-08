# AlmaLinux8.0 - sshd セキュリティ周り


port22から port1234に変更する。
fwのportを開けておく。
``` 
# チェック
firewallcmd --list-services
firewallcmd --list-ports

# 設定
firewall-cmd --add-port=1234/tcp --permanent
firewall-cmd --reload
```

sshdの設定
``` 
cd /etc/sshd
vim sshd.conf
```

``` 
# rootのログイン禁止
PermitRootLogin no

# rootでの鍵認証のログインも禁止
PermitRootLogin without-password

# 鍵認証を許可する。
# root以外のユーザが鍵認証を使うときにはこれを設定する必要がある。
UsePAM yes
```
port変更
``` 
Port 1234
```


設定ファイルに問題がないかをシェックする
``` 
sshd -t
```

sshd再起動
``` 
systemctl reload sshd
```

fwの22portを閉じる
``` 
firewall-cmd --remove-service=ssh --permanent
firewall-cmd --reload
```

