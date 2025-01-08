# aws s3 

拡張子が `.png` を調べる

```bash
path="s3://<bucket>/file/"
aws s3 ls "$path" --recursive | grep ".png$"
```

再帰的に削除

```bash
aws s3 rm "$path" --recursive 
```

