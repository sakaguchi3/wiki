# ssh鍵のfingerprintを確認, kw:ssh-key

## サーバサイドの公開鍵のチェク

サーバ(host_keys)のフィンガープリントを確認。  

```bash
# bashの場合
ff=/etc/ssh/*.pub
# zshの場合
#ff=(/etc/ssh/*.pub)

for f in $ff ; do
 ssh-keygen -l -f $f
done

256 xx:xx:....  (ECDSA)
256 xx:xx:....  (ED25519)
2048 xx:xx:.... (RSA)
```

クライアント側で、過去に接続したサーバ側の公開鍵のフィンガープリントを確認。
ここではgithubの例。

```bash
ssh-keygen -l -f ~/.ssh/known_hosts | grep github

3072 SHA256:uNiVztksCsDhcc0u9e8BujQXVUpKZIDTMczCvj3tD2s github.com (RSA)
256 SHA256:p2QAMXNIC1TJYWeIOttrVc98/R1BUFWu3/LiyKgUfQM github.com (ECDSA)
256 SHA256:+DiY3wvvV6TuJJhbpZisF/zLDA0zPMSvHdkr4UvCOqU github.com (ED25519)
```

## クライアントのssh公開鍵のチェク

クライアントのssh公開鍵のフィンガープリントを確認

```bash
ssh-keygen -l -f ~/.ssh/id_ed25519.pub 

256 xx:xx:xx...   (ED25519)
```
