# mysql -  create tableに文字コードをセットする



```mysql
CREATE DATABASE my_sample_db CHARACTER SET utf8;

1 row(s) affected, 1 
warning(s): 3719 'utf8' is currently an alias for the character set UTF8MB3, 
but will be an alias for UTF8MB4 in a future release. Please consider using UTF8MB4 in order to be unambiguous.
```

mysql8ではutf8mb3にするのが良いらしい。

``` 
CREATE DATABASE IF NOT EXISTS my_sample_db CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
```

```mysql
-- 文字コード/照合順序の確認
SELECT * FROM INFORMATION_SCHEMA.SCHEMATA;
 
-- 字コード/照合順序変更
ALTER DATABASE sample_db DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci; 
```




