# mysql columnを修正する


## columnを削除する

エラー内容

```
> ALTER TABLE my_table DROP COLUMN fk_id ; 
Error Code: 1828. Cannot drop column 'fk_id': needed in a foreign key constraint 't_other_table_ibfk_3'
```

手順

* FKを削除する
* columnを削除する

```
SHOW CREATE TABLE my_table;

ALTER TABLE my_table DROP FOREIGN KEY t_other_table_ibfk_3;
ALTER TABLE my_table DROP COLUMN fk_id ; 
```



## columnのunique制約を削除する

エラー内容
```
> ALTER TABLE my_table DROP INDEX  fk_id
Error Code: 1553. Cannot drop index 'fk_id': needed in a foreign key constraint
```

手順

* FKを削除
* unique制約を削除
* FKを作成


```
SHOW CREATE TABLE my_table;

ALTER TABLE my_table DROP FOREIGN KEY t_other_table_ibfk_2;
ALTER TABLE my_table DROP INDEX  fk_id

ALTER TABLE my_table
	ADD FOREIGN KEY (fk_id)
	REFERENCES t_other_table (id)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
; 
```



