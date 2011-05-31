# AlmaLinux8.0 - partition作成〜フォーマット

diskを確認する
```
fdisk -l

Disk /dev/vda: 20 GiB, 21474836480 bytes, 41943040 sectors
xxxx

Disk /dev/vdb: 100 GiB, 107374182400 bytes, 209715200 sectors 
xxxx
```

vdbをパーティショニングする 
```
fdisk /dev/vdb

# print
Command (m for help): p

# フォーマットするディスクを選ぶ
Command (m for help): n
Partition number (1-4): 1

# write
Command (m for help): w 
```

フォーマット 
```
mkfs -t ext4 /dev/vdb
```


uuidを取得
```
blkid 
/dev/vdb: UUID=xxxxx
```

fstab
```
vim /etc/fstab
```

```
/dev/vdb /mnt/vdb ext4      defaults 0      2 
```

### フィールドの意味
```
<dev> <mount point> <format> <option> <dump> <pass>
```
*dump: 0*
dumpコマンドを実行した時に保存する/しない。
0: 保存しない
1: 保存する

*pass: 2*
ブート時のfsckのチェックする順番。

* 0: チェックなし
* 1: 優先度が高い。一番初めにチェクされる
* 2: 優先度が低い


```
mount -a
```
