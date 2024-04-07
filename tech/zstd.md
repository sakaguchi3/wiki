# zstd - 圧縮

## ディレクトリ

### ディレクトリ圧縮

```bash
mkdir dir
echo 'a'  dir/file1
echo 'a'  dir/file2
```

```bash
tar caf dir.tar.zst dir
# このやり方でもできる
tar -Izstd -cf dir.tar.zst dir
```

### ディレクトリ解凍

```bash
tar xf dir.tar.zst
```

## ファイル

### ファイル圧縮

```bash
echo 'a' > file
```

```bash
zstd file

ls -l 
file.zst
```

### ファイル解凍

```bash
zstd -d file.zst
```
