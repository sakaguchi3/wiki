# Dockerでredis構築



```bash
docker pull redis-server
```

```bash
docker run --name dev-redis -d -p 6379:6379 redis redis-server  
```

```bash
docker stop dev-redis
docker start dev-redis
```


