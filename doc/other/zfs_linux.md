# zfs

## メモリ使用量を制限 linux

設定ファイル
```bash
kstat.zfs.darwin.tunable.zfs_arc_max=524288000
```

max, minを設定。

```conf
options zfs zfs_arc_min=1073741823
options zfs zfs_arc_max=1073741824
```

## 暗号化

rawモード
```bash
dd if=/dev/urandom of=/path/to/key bs=1 count=32

zfs create \
  -o encryption=on \
  -o keyformat=raw \
  -o keylocation=file:///path/to/key \
  <nameofzpool>/<nameofdataset>
```

## 鍵の変更

```bash
key=/media/key
dd if=/dev/urandom of="$key" bs=1 count=32

zfs change-key \
 -o keyformat=raw \
 -o keylocation="file://$key" \
 tank/mydataset
```

* <https://openzfs.github.io/openzfs-docs/man/master/8/zfs-change-key.8.html>



<!--
```bash
```

-->