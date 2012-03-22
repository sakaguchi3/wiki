# zfs mac

## メモリ使用量を制限 mac

設定ファイル
```bash
nvim /etc/zfs/zsysctl.conf
```

500MBに設定
```conf
kstat.zfs.darwin.tunable.zfs_arc_max=524288000
```

see: <https://openzfsonosx.org/wiki/Memory_utilization>

## import mac

import

```bash
disk1=/dev/disk2s1
pool=tank1
mnt1=/mnt/tank1

zpool \
  import -d "$disk1" \
  -R "$mnt1" \
  -N \
  "$pool"
```

load key, mount
```bash
key=file:///etc/key
zfs load-key \
 -L "$key" \
 "k"

dataset="${pool}/test"
mnt="$HOME/mnt/test"
zfs mount "$dataset" -O mountpoint=$mnt
```

<!--
```bash
```

-->