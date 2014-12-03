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

## 解凍

```bash
zstd -d file.zst
```
