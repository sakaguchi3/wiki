# gpg - 鍵の削除

```bash
k=<keyid>
```

公開鍵の削除

```bash
gpg --delete-keys $k
```

秘密鍵の削除

```bash
gpg --delete-secret-keys $k
```

秘密鍵を削除するときにマスターキーをすでに削除してたりすると次のようなエラーが出てくる事がある。
`delete key failed: Not found`  
強制的に削除するには以下を実行。

```bash
gpg --batch --yes --delete-secret-and-public-key $k
```
