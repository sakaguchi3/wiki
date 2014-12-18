# shred - ファイルを完全に削除する

## install

### macOS

```
brew install coreutils
```

### arch linux

```
pacman -Syu coreutils
```

## usage 

```bash
echo 'test' > testfile
shread -u -n1 testfile
```