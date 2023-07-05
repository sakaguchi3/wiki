# nvimで暗号化

vimでは`vim -X`で暗号化が使えたけど、nvimでは使えなくなっった。
仕方ないのでgpgと組み合わせて使うようにした。

## 暗号

```bash
echo 'aaa' > hoge.txt

file_org='hoge.txt'
file_enc="${file_org}.asc"
```

```bash
gpg -a -c "${file_org}"
Password: 
```

平文は削除

```bash
shred -u -n1 "${file_org}"
```

## 復号

```bash
gpg < "${file_org}.asc" | nvim -R -
```
