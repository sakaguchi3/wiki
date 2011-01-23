# opensslでファイルの暗号化


## encrypt

```bash
openssl enc -e -aes-128-cbc -pass file./passwd.txt -salt \
 -in file.txt \
 -out file.txt.enc \
  
```

## decrypt

```bash
openssl enc -d -aes-128-cbc -pass file./passwd.txt \
 -in file.txt \
 -out file.txt.dec \
  
```
  
 
