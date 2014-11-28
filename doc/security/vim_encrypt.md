# vimで暗号化

## 暗号

```bash
vim file.txt
```

暗号化して保存

```vim
:X
Enter encryption key: 
<your_passwd>

:w
```

## 複合

```bash
vim file.txt
```

起動時にパスワードを求められる

```bash
Enter encryption key:
<your_passwd>
```
