# docker 



### 用語

|用語|意味|
|:----|:----|
|host |dockerを動かすマシン | 
|docker | | 
|コンテナ |仮想マシン，イメージを動かすためのモノ？ | 
|image |centos,apache, tomcat,  php, python, vim, | 
|docker hub |imageがDLできるところ | 
| | | 

### 手順

1. docker hub から pull | イメージ取得
1. docker run | イメージからコンテナ生成して起動
1. exec | コンテナ
1. stop | コンテナ
1. commit | コンテナをイメージ化
1. rm | コンテナ
1. rm | イメージ

### コマンド

|コマンド|用途|
|:-----|:-----|
|docker --version||
|docker info||
|||


## dockerを触ってみる

### docker起動/停止

```-v```で指定するものはボリュームって呼ぶ

```bash
$ docker run -d -p 8080:80 -v $(pwd)/nginx/log:/var/log/nginx --name webserver nginx
$ docker stop webserver
```

起動してるコンテナ確認
 
```bash
$ docker ps
$ docker ps -a # 停止しているのも確認
```

### コンテナにログイン

```bash
$ docker exec -it webserver /bin/bash
```

### コンテナをイメージ化

```bash
$ docker commit webserver webserver:0.0
$ docker images # イメージ一覧
```

### コンテナ起動

```bash
$ docker start webserver
```
### コンテナを削除

```bash
$ docker rm webserver
$ docker ps -a
``` 

### link

* https://qiita.com/k5n/items/2212b87feac5ebc33ecb

