# gpgでファイルの暗号化

## 公開鍵暗号

importされている鍵リストを表示

```bash
gpg -k

pub   ed25519 2023-05-09 [SC] [expires: 2036-05-05]
      da39a3ee5e6b4b0d3255bfef95601890afd80709
uid           [ultimate] <example> <example@example.com>
sub   cv25519 2023-05-09 [E] [expires: 2096-05-05]
```

### asymmetric encryption

sign & encrypt

```bash
gpg -e -r <fingerprint or email> <file>
```

compress levelを指定, no compression

```bash
gpg -e --compress-level 0 -r <fingerprint or email> <file>
```

sign & encrypt

```bash
gpg -e -s -r <fingerprint or email> <file>
```

example

```bash
echo 'test' > test.txt
gpg -e -r da39a3ee5e6b4b0d3255bfef95601890afd80709 test.txt

ls
test.txt
test.txt.gpg
```

### asymmetric decryption

```bash
rm test.txt

gpg test.txt.gpg
passwd:

ls
test.txt
```

or

```bash
gpg -d <file>.gpg
gpg -d <file>.gpg -o <output_file_name>
```

## 共通鍵暗号

### symmetric encryption

```bash
gpg -c file.txt
passwd: 

ls  
file.txt
file.txt.gpg
```

### symmetric decrypt

```bash
gpg file.txt.gpg 
passwd:

ls 
file.txt
```

### ファイルからパスワードを読み取る

```bash
echo 'your_password' > pass
echo 'aaa' > file
```

暗号

```bash
gpg --batch --passphrase-fd 0 -c file < pass
```

複合

```bash
gpg --batch --passphrase-fd 0 file.gpg < pass 
```

<!-- 
```bash
```
-->

## gpg-agentをkill

```bash
ps aux | grep gpg-agent
kill ${pid}
```
  