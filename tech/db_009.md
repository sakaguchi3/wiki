# DB - Table定義変更  


## Columnを追加する

```sql 
ALTER TABLE t_test_table
ADD COLUMN file_name varchar(150) NOT NULL COMMENT 'file_name'
AFTER path
```

## Columnの定義を変更する

```sql
ALTER TABLE t_test_table
MODIFY COLUMN file_name varchar(90) NOT NULL COMMENT 'file_name' 
```


## Columnの名前を変更する

```sql
ALTER TABLE t_test_table
CHANGE  COLUMN new_file_name varchar(150) NOT NULL COMMENT 'file_name'
```


## Columnを削除する

```sql 
ALTER TABLE t_test_table
DROP COLUMN new_file_name
```

## あとから複合Unique制約を追加する

```sql 
alter table t_test_table
add CONSTRAINT unq_t_test_table_idx01 UNIQUE (supplier_id, year, month)
```


## Tableを削除する

```sql
DROP TABLE `t_test_table`; 
```