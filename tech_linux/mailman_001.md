# mailman - spamメールをフィルタする


管理画面にログインする．  
送信者フィルタをクリックする．


![](mailman_001/i001.png)


自動的に投稿を破棄する非会員のアドレスにspamしたいアドレスを追加する． 

![](mailman_001/i002.png)

正規表現も使える．  
正規表現を使う場合は先頭を `^` から始める．

```regexp
hogefuga@example.jp
^.*@example.com
```