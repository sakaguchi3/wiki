# ffmpeg



### mp4→mp3に変換

```bash
$ffmpeg -y -i hoge.mp4 -ab 128k hoge.mp3 
```

### バックグラウンドで実行したい

```bash
 ffmpeg -y -i hoge.mp4 -ab 128k hoge.mp3 > /dev/null 2>&1
```


### link

* http://blog.prophet.jp/1232
