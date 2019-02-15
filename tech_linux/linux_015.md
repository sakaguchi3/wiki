# netcat



### ポートスキャン
```bash
sudo nc -vn -z -w2 192.168.0.72 3380-3399
or
sudo nc -vz ushi.localdomain  3306
```


### udpで送信する
```bash
dd if=/dev/zero of=dummy.iso bs=1G count=1
sudo nc -u 192.168.0.72 57717 < dummy.iso
```
