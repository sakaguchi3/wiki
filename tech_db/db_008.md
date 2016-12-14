# DB - Error Code: 1170. BLOB/TEXT が起きたときの対処法 

## TL;DR
VARCHARとかTEXTとかをindex/unique keyとして利用する際は長さを指定する必要がある．

## やり方


```sql
# DDL
CREATE TABLE t_test_table
(
	id bigint NOT NULL AUTO_INCREMENT COMMENT 'id',
	test_column text NOT NULL ,
	year int NOT NULL COMMENT 'year',
	month int NOT NULL COMMENT 'month',
	delete_flg char(1) DEFAULT '0' NOT NULL ,
	PRIMARY KEY (id),
	CONSTRAINT unq_t_supplier_report_idx UNIQUE (year, month, test_column)
) 
```

コレを実行する


```SQL
Error Code: 1170. BLOB/TEXT column 'test_column' used in key specification without a key length
```

エラーが発生する． 長さが指定されていないものはIndexとして使えないので、長さを指定する必要があるらしい．  
test_dolumn(100)という具合に長さを指定してあげる．

```sql
# DDL
CREATE TABLE t_test_table
(
	id bigint NOT NULL AUTO_INCREMENT COMMENT 'id',
	test_column text NOT NULL ,
	year int NOT NULL COMMENT 'year',
	month int NOT NULL COMMENT 'month',
	delete_flg char(1) DEFAULT '0' NOT NULL ,
	PRIMARY KEY (id),
	CONSTRAINT unq_t_supplier_report_idx UNIQUE (year, month, test_column(10))
) 
```

エラーが発生しなくなった．