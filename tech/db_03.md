# DB - insert update  

## 概要
一回の命令文で、複数レコードのアップデートするには、「insert into ～ values ～ on duplicate key ～」を使う。<br>
unique key は必ず必要。 
unique key は複合uniqueでもOK．



## やり方

### DDL  
id を unique key とする．
```sql
CREATE TABLE `my_table` (
  `id` int(10) unsigned NOT NULL,
  `update_time` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB;
```


### insert updateクエリ．  

if (idがない) then insert   
else update

```sql
INSERT INTO `my_table`
	(id, update_time) 
VALUES 
	(1, '2016-02-13'),
	(2, '2016-02-14')
ON DUPLICATE KEY UPDATE 
	update_time = VALUES(`update_time`)
;
```
