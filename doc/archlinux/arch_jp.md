# Arch 日本語環境

日本語フォント
```bash
pacman -S noto-fonts-cjk
or
pacman -S otf-ipaexfont
```

## 日本語入力

日本語入力
```bash
pacman -S fcitx5-im fcitx5-mozc
```

fcitx5

```bash
nvim ~/.xinirc
```

```bash
GTK_IM_MODULE="fcitx"
QT_IM_MODULE="fcitx"
XMODIFIERS='@im=fcitx'
```

* <https://wiki.archlinux.jp/index.php/Fcitx5>
* <https://note.kurodigi.com/archlinux-fcitx5/>



<!--
```bash
```

-->