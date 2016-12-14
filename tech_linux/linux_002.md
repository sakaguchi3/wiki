# 2TBを超えるHDDのformat方法

## 巨大パーティション作成

2TBを超える場合はfdiskじゃだめだったので、partedを使う。

```shell
fox@selene /mnt % sudo parted /dev/sda
GNU Parted 3.2
Using /dev/sda
Welcome to GNU Parted! Type 'help' to view a list of commands.

(parted) mklabel gpt
Warning: The existing disk label on /dev/sda will be destroyed and all data on this disk will be lost. Do you
want to continue?
Yes/No? yes

(parted) mkpart
Partition name?  []? part00000
File system type?  [ext2]? xfs
Start? 0%
End? 100%

(parted) p
Model: WDC WD30 XXXXXXXXXXXXX (scsi)
Disk /dev/sda: 3001GB
Sector size (logical/physical): 512B/512B
Partition Table: gpt
Disk Flags:

Number  Start   End     Size    File system  Name          Flags
 1      1049kB  3001GB  3001GB  xfs          part00000

(parted) q
Information: You may need to update /etc/fstab.
```

## format

```
fox@selene /mnt % sudo   mkfs.xfs /dev/sda1
meta-data=/dev/sda1              isize=256    agcount=4, agsize=183141568 blks
         =                       sectsz=512   attr=2, projid32bit=1
         =                       crc=0        finobt=0
data     =                       bsize=4096   blocks=732566272, imaxpct=5
         =                       sunit=0      swidth=0 blks
naming   =version 2              bsize=4096   ascii-ci=0 ftype=0
log      =internal log           bsize=4096   blocks=357698, version=2
         =                       sectsz=512   sunit=0 blks, lazy-c
```

## uuid取得
```shell
fox@selena sudo mount /dev/sda1 /mnt/mountpoint
fox@selena sudo blkid
/dev/sda1: UUID="XXXX-XXXX" TYPE="xfs" PARTLABEL="part00000" PARTUUID="XXXX" 
```