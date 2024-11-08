# kernelをlinuxからlinux-ltsに変更

ここで紹介するやり方は systemd-boot を使ってる場合。  
grubを使っている場合はやり方が異なる。  

## ltsをインストール

```bash
pacman -S linux-lts linux-lts-headers
```

確認

```bash
❯  ls -1 /boot 
EFI/
initramfs-linux-fallback.img*
initramfs-linux.img*
initramfs-linux-lts-fallback.img*
initramfs-linux-lts.img*
intel-ucode.img*
loader/
vmlinuz-linux*
vmlinuz-linux-lts*
```

## 設定

```bash
cd /boot/loader/entries
```

中身

```bash
> cat linux.conf

title   Arch Linux (linux)
linux   /vmlinuz-linux
initrd  /intel-ucode.img
initrd  /initramfs-linux.img
options cryptdevice=PARTUUID=*****
```

設定ファイルコピーして、lts用のファイルを作成する。

```bash
cp linux.conf linux-lt.conf
vim linux-lts.conf
```

以下の箇所を変更する。

```conf
title   Arch Linux (linux-lts)
linux   /vmlinuz-linux-lts
initrd  /intel-ucode.img
initrd  /initramfs-linux-lts.img
options cryptdevice=PARTUUID=*****

```

これは必要なのかどうか不明

```bash
bootctl update
```

## 再起動

boot画面でいかが選べるようになる

```markdown
* title   Arch Linux (linux)
* title   Arch Linux (linux-lts)
```
<!--
```bash
```
a
-->