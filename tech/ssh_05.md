# ssh 


## パスワード認証で接続する

```bash
$ ssh -o PreferredAuthentications=password host1.example.com
```


## Timeout防止

`-o ServerAliveInterval=60`オプションを付ける

```bash
$ ssh hoge@example.com -P 22 -o ServerAliveInterval=60 
```


