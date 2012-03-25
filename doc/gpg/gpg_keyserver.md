# gpg 公開鍵を鍵サーバにアップロードする

mportされている鍵リストを表示

```bash
gpg -k

pub   ed25519 2023-05-09 [SC] [expires: 2036-05-05]
      aa3993e95e6b4b0d3255bfef95601890afd80709
uid           [ultimate] <example> <example@example.com>
sub   cv25519 2023-05-09 [E] [expires: 2096-05-05]
```

```bash
k=aa3993e95e6b4b0d3255bfef95601890afd80709
```

アップロード

```bash
 gpg --export $k | curl -T - https://keys.openpgp.org
```

検索

```bash
 gpg --auto-key-locate hkps://keys.openpgp.org  --locate-keys $k
```
