# veracrypt

## setup

```bash
dev1="/dev/disk/by-id/xxxx"
key="/etc/key"

veracrypt \
   -t \
   --create \
   --keyfiles="$key" \
   --hash=sha-512 \
   --encryption=AES \
   --random-source=/dev/urandom \
   --volume-type=normal \
   --filesystem=none $dev1 
```

## mount

mount
```bash
mnt=/mnt/mnt1

veracrypt -t --mount \
 "$dev1"  \
 "$mnt" \
 --pim 0 \
 --keyfiles "$key" \
 --protect-hidden no  \
 --verbose
```

list
```bash
veracrypt -t --list
```

## umount

```bash
veracrypt --text --dismount --slot 1
or
veracrypt --text --dismount "$mnt"
```

<!--
```bash
```

-->