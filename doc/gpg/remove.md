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

## サブキーを削除

```bash
❯ k=xxx1
```

```bash
❯ gpg --edit-key $k                                                 
                                           
sec  ed448/xxx1
     created: 2023-07-15  expires: never       usage: C   
     trust: ultimate      validity: ultimate 
ssb  ed448/yyy1
     created: 2023-07-15  expires: never       usage: S   
ssb  cv448/yyy2
     created: 2023-07-15  expires: never       usage: E   
ssb  ed25519/yyy3
     created: 2023-07-15  expires: never       usage: S   
[ultimate] (1). ((⊂(╹◡╹๑∩) <a@example.com>
```

`yyy3`を削除するとする。
鍵を選択する。
対象の鍵に`*`マークが付く。

```bash
gpg> key yyy3

sec  ed448/xxx1
     created: 2023-07-15  expires: never       usage: C   
     trust: ultimate      validity: ultimate 
ssb  ed448/yyy1
     created: 2023-07-15  expires: never       usage: S   
ssb  cv448/yyy2
     created: 2023-07-15  expires: never       usage: E   
ssb*  ed25519/yyy3
     created: 2023-07-15  expires: never       usage: S   
```

削除実行

```bash
gpg> delkey 
Do you really want to delete this key? (y/N) y

sec  ed448/xxx1
     created: 2023-07-15  expires: never       usage: C   
     trust: ultimate      validity: ultimate 
ssb  ed448/yyy1
     created: 2023-07-15  expires: never       usage: S   
ssb  cv448/yyy2
     created: 2023-07-15  expires: never       usage: E   

gpg> q
Save changes? (y/N) y
```
