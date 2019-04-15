# mongodb - import from js



bash からの処理

```bash
$ mongo --host mytest.localdomain
```



mongodb内での処理

```mongo
> use mydb
> load("dump-mydb.js")
```






