# OAuth2.0 メモ

# get構造

参考: https://wp.tech-style.info/archives/683

* http://api.example.com/v1/articles 
* http://api.example.com/v1/articles/126
    * articleId=126
* http://api.example.com/v1/articles/126/comments
      * articleId=26のコメント全件
* http://api.example.com/v1/articles/126/comments/10
    * articleId=26のコメントの、commendId=10

* put 
    * リソース(/article/10)が存在する場合は更新(置き換え)を行い、リソースが存在しない場合は登録を行います
* post
    * リソース指定はNG


# httpステータスコード

https://meetup-jp.toast.com/931

# credential

https://syncer.jp/Web/API/Twitter/REST_API/#section-3

# メモ
* `https://docs.oracle.com/cd/E83857_01/paas/process-cloud/user/using-oauth-rest-apis.html#GUID-4F352B12-D865-48C6-A70D-B4C913870646`

```bash
curl -i -H 'X-USER-IDENTITY-DOMAIN-NAME: OAuthTestTenant125' 
-u <client_id>:<client_secret> 
-H 'Content-Type: application/x-www-form-urlencoded;charset=UTF-8'
--request POST http://<identity-domain>.<data-center>.oraclecloud.com/oam/oauth2/tokens 
-d 'grant_type=client_credentials'
```


* https://developer.github.com/v3/
  

認証情報は クエリストリングには入れずに、Headerに入れるほうがいいらしい
* https://developer.github.com/changes/2020-02-10-deprecating-auth-through-query-param/
```bash
curl -H 'Authorization: token my_access_token' https://api.github.com/user/repos
```

# cursorのアイデア

* https://api.slack.com/docs/pagination
* https://developer.cybozu.io/hc/ja/articles/360029152012