# ssh-agent

起動

```bash
eval `ssh-agent`
```

停止

```bash
eval `ssh-agent -k`
```

鍵の追加

```bash
ssh-add  ~/.ssh/<your_private_key>
```

すべての鍵の削除

```bash
ssh-add -D
```

追加された鍵の確認

```bash
ssh-add -l
```

## リモート先で鍵を引き継ぐ

クライアントマシンで鍵の設定をする。
`-A`をつけてリモート先で引き継ぐ。

```bash
eval `ssh-agent`
ssh-add  ~/.ssh/<your_private_key>
ssh-add -l

ssh -A <host>
```

リモート先で鍵が追加されているか確認する

```bash
ssh-add -l
(正常であればクライアントで追加した鍵が表示される)
```

## .ssh/config でリモート先に引き継ぎ設定

`ssh -A <your_host>` と同じ。

```bash
Host your_host
        ForwardAgent yes
```
