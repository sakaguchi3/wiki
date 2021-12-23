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


マウントする
```
blkid 
/dev/vdb: UUID=xxxxx

vim /etc/fstab

mount -a
```
