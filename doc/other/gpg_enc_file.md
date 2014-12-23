# gpgでファイルの暗号化

# 公開鍵暗号

importされている鍵リストを表示

```bash
gpg -k

pub   ed25519 2023-05-09 [SC] [expires: 2036-05-05]
      da39a3ee5e6b4b0d3255bfef95601890afd80709
uid           [ultimate] <example> <example@example.com>
sub   cv25519 2023-05-09 [E] [expires: 2096-05-05]
```

## encrypt

```bash
gpg -e <fingerprint or email> <file>
```

```bash
echo 'test' > test.txt
gpg -e da39a3ee5e6b4b0d3255bfef95601890afd80709 test.txt

ls
test.txt
test.txt.gpg
```

## decrypt

```bash
gpg test.txt.gpg
passwd:

ls
test.txt
```

# 共通鍵暗号

## encrypt

```bash
gpg -c file.txt
passwd: 

ls  
file.txt
file.txt.gpg
```

## decrypt

```bash
gpg file.txt.gpg 
passwd:

ls 
file.txt
```

## gpg-agentをkill
```bash
ps aux | grep gpg-agent
kill ${pid}
```
  
 
