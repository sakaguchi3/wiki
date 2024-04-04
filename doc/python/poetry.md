# poetry

## モジュールのインストールエラーが出るときの対処法

```bash
❯  poetry install
❯ ./run.sh  
"module 'ffmpeg' has no attribute 'probe'"
module 'ffmpeg' has no attribute 'probe'  
```

```bash
poetry remove ffmpeg-probe
poetry add ffmpeg-probe 
```


<!-- 
```bash
```

 -->
