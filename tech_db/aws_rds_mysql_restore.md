# aws rds mysql を dump からリストアする



## export dump 

```sql
mysqldump -u<user> -p<your_pass> \
  -h<host>  \
  --single-transaction \
  <db> <table> \
  > dump.sql \
  \
```


## 置換

```
ERROR 1227 (42000) Access denied; you need (at least one of) the SUPER privilege(s) for this operation
```

このままmysql importするとエラーが表示される。  
`SET`などが含まれていると、aws rdsは権限周りの関係でエラーが起きるっぽい。  

```shell
$ sed  '/^\//d' dump.sql | sed '/^SET @/d' | sed '/^--/d' > modified_dump.sql
```

`SET`をすべて取り除く。ついでに不要なコメントも取り除く。

## restore

```shell
mysql -u<user> -p<your_pass> \
  -h<host>  \
  <db> \
  < modified_dump.sql \
  \
```


うまくいった。

