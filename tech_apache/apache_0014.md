# apache - 各種情報を隠す 



```.htaccessなどに以下を記述する```


### OS情報を隠す

```.htaccess
ServerSignature Off
```


### ディレクトリ一覧を隠す

```.htaccess
Options -Indexes FollowSymLinks
```