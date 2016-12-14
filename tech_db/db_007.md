# DB - SQLの結果をファイルにアウトプットする






```sql
SELECT * 
FROM users
INTO OUTFILE '/tmp/users.csv'
FIELDS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"';
```

URL: https://qiita.com/catatsuy/items/9fdf4423d5f4885b9bf9