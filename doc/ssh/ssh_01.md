# ssh client

## エラーメッセージ `WARNING: REMOTE HOST IDENTIFICATION HAS CHANGED!` 

サーバのssh-keyが変わるとエラーが出る
```bash
WARNING: REMOTE HOST IDENTIFICATION HAS CHANGED!
```

`~/.ssh/known_hosts`から削除
```bash
ssh-keygen -R <server ip>
```

<!--
```bash
```

-->