# aws rds mysqldump で export/import



## export dump 

```shell
mysqldump -u<user> -p<pass> \
  -h<host> \
  --single-transaction \
  --complete-insert \
  --set-gtid-purged=off --no-create-info --skip-add-drop-table \
  <db> <table> \
  --where ' TRUE ' \
  > dump.sql \
\
```


## import

```shell
mysql -u<user> -p<your_pass> \
  -h<host>  \
  <db> \
  < dump.sql \
  \
```


