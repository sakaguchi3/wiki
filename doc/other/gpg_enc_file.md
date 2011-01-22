# gpgでファイルの暗号化


## encrypt

```bash
gpg -c file.txt
```

成功すると `file.txt.gpg` が作成される。

## decrypt

```bash
gpg file.gpg 
```

## gpg-agentをkill

macの場合gpgを起動するとgpg-agentも起動される。
gpgを動かすとgpg-agentがずっと起動状態になるので、暗号化/復号化が終わったらgpg-agentをkillしておく。

```bash
ps aux | grep gpg-agent
kill ${pid}
```
  
 
