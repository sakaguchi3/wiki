# btrfs

## mount

```bash
uuid="DC4C27F4-8FF2-4136-A701-255D2E417C01" 

mount UUID="$uuid" /mnt/fuga0

btrfs subvolume list /mnt/fuga0

mount UUID="$uuid"  \
 -o subvolid=262 /mnt/fuga1

mount UUID="$uuid"  \
 -o subvol=@ /mnt/fuga2

```


<!--
```bash
```

-->