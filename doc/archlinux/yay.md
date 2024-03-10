# ArchLinuxでyayを使う, keyword:aur

## install

```bash
pacman -Syu binutils make gcc
```

```bash
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
```

## 使い方

search

```bash
yay -Ss [keyword]
```

install

```bash
yay -S [package_name]
```

update

```bash
yay <package>
```

remove

```bash
yay -Rns [package_name]
```

## その他

インストール済み一覧
```bash
yay -Sl
```

## link

* <https://linuxcommandlibrary.com/man/yay>

<!--
```bash
```
a
-->