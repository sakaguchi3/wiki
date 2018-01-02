# curl


# 二種類のcurl. MIMEタイプによって異なる

`application/x-www-form-urlencode`    
apiとかで利用される。
```bash
curl  http://localhost:8080/hoge/api -X POST -d '{"key1":"val1", "key2":"val2"}' -H "Content-Type: application/json"
```

`multipart/form-data`    
HTML formで利用される。
文字列と画像とかタイプの違うものを1requestで送信できる。
```bash
curl  http://localhost:8080/hoge/api -X POST -F 'key1=val1' -F 'key2=val2'
```



# ファイルからpostしたい

`-d @{filename}`でファイルを指定する

```body.txt
{"key1":1, "key2":"val2"}
```

```bash
curl -v \
  -H "Accept: application/json" \
  -H "Content-type: application/json" -X POST \
  -d @body.txt  \
  http://localhost:3000/api/ushi
```
