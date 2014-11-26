# zstd - 圧縮

## 圧縮

```bash
echo 'a' > file
```

```bash
zstd file

ls -l 
file.zst
```

ディレクトリを圧縮

```bash
mkdir dir
echo 'a'  dir/file1
echo 'a'  dir/file2

tar caf dir.tar.zst dir
```

## 解凍

```bash
zstd -d file.zst
```

```bash
tar xf dir.tar.zst
```
