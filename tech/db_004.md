# server - DB バックアップ/リストア

#### バックアップ

```bash
$ mysqldump -u dbuser  -p  mydb my_table > dump__my_table__yyyymmdd.sql
```


#### リストア

```bash 
$ mysql -u dbuser -p -D mydb < dump__my_table__yyyymmdd.sql 
```
