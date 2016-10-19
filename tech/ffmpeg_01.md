# ffmpeg



### mp4→mp3に変換


```bash
 ffmpeg -y -i hoge.mp4 -ab 128k hoge.mp3 > /dev/null 2>&1 < /dev/null
```

### webm -> mp3

```bash
ffmpeg  -i hoge.webm   -acodec libmp3lame -aq 4 hoge.mp3    > /dev/null 2>&1 </dev/null
```

### link

* http://blog.prophet.jp/1232
