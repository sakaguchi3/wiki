# Dockerでmongodbを構築


```bash
docker pull mongo
```

```bash
docker images
```

```bash
docker ps -a
```

```bash
docker run -p 27017:27017 --name dev-mongo -d mongo
```

```bash
docker stop dev-mongo
```

```bash
docker start dev-mongo
```


* https://qiita.com/tanakaworld/items/68fb4817d24418f32cd8

