# mongodb - import from js


### 方法1: mongoにログインしてからjsファイルをロードする

mongo shellにログイン

```bash
$ mongo --host mytest.localdomain
```



mongo shellからjsファイルをロードする

```mongo
> use mydb
> load("dump-mydb.js")
```



### 方法2: mongoimportを使ってimport



```bash
$ mongoimport --db mydb --collection  mydb_collection  --file ./mydump.json  --host mongodb.example.com
```

mydb, mydb_collection を適宜変更



