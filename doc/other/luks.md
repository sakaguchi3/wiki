# luks

## cryptsetup

パスワード
```bash
dev1="/dev/disk/by-id/ata-7DFD2B00-E9AB-4E55-89D2-4992D2A30B6E"
cryptsetup luksFormat "$dev1"
```

パスワードの代わりに鍵ファイルを使う
```bash
key1="/etc/key.key"
dd bs=512 count=4 if=/dev/random of=$key1
chmod 400 $key1

cryptsetup luksFormat $dev1 $key1
```

ヘッダを確認
```bash
cryptsetup luksDump $dev1
```

### open / unlcok
open
```bash
dm_name1=mapper1
uuid1=xxxxxx
cryptsetup open UUID=$uuid1 $dm_name1 --key-file $key1
```

close
```bash
cryptsetup close $dm_name1 
```

### format filesystem

```bash
mapper1="/dev/mapper/$dm_name1"
mkfs.btrfs  $mapper1
```

mount
```bash
mnt1=/mnt/mnt1
mount $mapper1 $mnt1
```

## headerのバックアップ

<https://wiki.archlinux.jp/index.php/Dm-crypt/%E3%83%87%E3%83%90%E3%82%A4%E3%82%B9%E3%81%AE%E6%9A%97%E5%8F%B7%E5%8C%96#.E6.89.8B.E5.8B.95.E3.83.90.E3.83.83.E3.82.AF.E3.82.A2.E3.83.83.E3.83.97.E3.81.A8.E3.83.AA.E3.82.B9.E3.83.88.E3.82.A2>

ddを使ったリストア
```bash
# ヘッダのエクスポート
dd if=/dev/<device> of=/path/to/<file>.img bs=512 count=4040

# ヘッダのリストア
dd if=./<file>.img of=/dev/<device> bs=512 count=4040
```

cryptsetupを使ったリストア
```bash
cryptsetup luksHeaderBackup /dev/<device> --header-backup-file /mnt/<backup>/<file>.img
```

## HDDを廃棄。完全消去

ヘッダーを削除
```bash
cryptsetup status nvme0n1p1_encrypted

cryptsetup luksErase /dev/mapper/vg0-data1
shred --remove --zero mykeyfile
```

ヘッダを0-fill
<https://wiki.archlinux.jp/index.php/Dm-crypt/%E3%83%89%E3%83%A9%E3%82%A4%E3%83%96%E3%81%AE%E6%BA%96%E5%82%99#LUKS_.E3.83.98.E3.83.83.E3.83.80.E3.83.BC.E3.82.92.E6.B6.88.E5.8E.BB>

```bash
 head -c 1052672 /dev/urandom > /dev/sda1; sync
# or
 dd if=/dev/urandom of=/dev/sda1 bs=512 count=20480
```

<!--
```bash
```

-->