# AlmaLinux8.0 - networkに固定ipの設定をする

インタフェースを表示
``` 
ip a
(略)
```

``` 
$ nmcli c  show
NAME       UUID  TYPE     DEVICE 
a0         xxxx ethernet  eth0   
local-eth1 xxxx ethernet  eth1   
```

down。削除。
``` 
nmcli connection down local-eth1 
```

ここではlocal-eth1の名前を変更する。
``` 
nmcli c add type ethernet ifname eth1 con-name a1 

$ nmcli c  show
(略)
```

固定ip設定
``` 
nmcli c modify a1 ipv4.method manual ipv4.addresses "172.16.0.10/24"
```

up
``` 
nmcli connection up a1 
```

https://access.redhat.com/documentation/ja-jp/red_hat_enterprise_linux/7/html-single/networking_guide/index
https://qiita.com/masa-tu/items/ffb28a76ca0ebafa1a16

