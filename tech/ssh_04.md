# ssh鍵作成関連


### id_ed25519

```bash
$ ssh-keygen -t ed25519 
```


### ビット長指定

```bash
$ ssh-keygen -t rsa -b 4096 
```

### パスフレーズ変更

パスフレーズが分かる場合

```bash
$ ssh-keygen -p -f ~/.ssh/id_rsa 
```


### コメント追加

```bash
$ ssh-keygen -t ecdsa -b 521 -C "hoge@example.com"
```

### convert putty-key to openssh-key


```bash
$ ssh-keygen -i -f id_rsa_putty.pub > id_rsa_openssh.pub 
```

### 鍵の強度の確認

```bash
$ ssh-keygen -l -f ~/.ssh/id_rsa.pub
```



### link

* https://qiita.com/suthio/items/2760e4cff0e185fe2db9
* https://www.server-memo.net/server-setting/ssh/rsa-fingerprint.html