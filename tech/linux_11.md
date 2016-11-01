# zip/unzip



### zip/unzip
```bash
zip -r  dir.zip dir/
```

```zsh
unzip dir.zip
```



### passwd付きzip


```zsh
zip -r -e dir.zip dir/
or
zip -r -e --password=xxxx dir.zip dir/
```

```zsh
unzip dir.zip
or
unzip -P xxx dir.zip
```

### 特定のディレクトリを除外する

```bash
$ zip  aaaaaaaaaaa_20130622.zip aaaaaaaaaaa -x "aaaaaaaaaaa/data/product/images/*" -r
```