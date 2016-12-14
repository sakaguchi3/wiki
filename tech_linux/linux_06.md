# server - webのバックアップ/リストア

#### バックアップ

tmpディレクトリは除外してバックアップ．

```bash
$ tar czf web_20yymmdd.tgz  web  --exclude "tmp/*"
```


#### リストア

```bash 
$ tar xzf web_20yymmdd.tgz 
```

tmp配下に必要ディレクトリを作成する <br>
  (Smarty/templates_cは自動でできるので作らなくてもOKっぽい)
```bash
$ cd web/fuel/app/
$ mkdir -p tmp/pdf_tmp
```
