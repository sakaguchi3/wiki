# urandom 



## 適当なパスワードの生成


``` 
cat /dev/random | base64 | fold -w 32 | head -n 50
```

`fold -w [桁数]`
`head -n [パスワードの個数]`





