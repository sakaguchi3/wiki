# nvimで暗号化

## 暗号

```bash
echo 'aaa' > hoge.txt

file_org='hoge.txt'
file_enc="${file_org}.asc"
```

```bash
gpg -a -c "${file_org}"
Password: 

shred -u -n1 "${file_org}"
```

## 復号

```bash
gpg < "${file_org}.asc" | nvim -R -
```
