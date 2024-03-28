# bcachefs

## install

```bash
yay -S bcachefs-tools
```

## format

```bash
dev1="/dev/disk/by-id/dev-81528F6A-E620-4E18-A5C6-67071515DD97"
bcachefs format --encrypted $dev1
```

## mount

```bash
bcachefs unlock $dev1

keyctl list @u
  1 key in keyring:
  1039930410: --alswrv     0     0 user: bcachefs:81528F6A-E620-4E18-A5C6-67071515DD97

keyctl link @u @s            

mnt1=/mnt/mnt1
mount -t bcachefs $dev1 $mnt1
```

## subvolume作成

```bash
bcachefs subvolume create $mnt1/volume1
```

## link

* <https://bcachefs.org/Encryption/>
* <https://wiki.archlinux.jp/index.php/Bcachefs>
* <https://nixos.wiki/wiki/Bcachefs>
* <https://wiki.gentoo.org/wiki/Bcachefs>



<!--
```bash
```

-->