# nginx | urlパターンマッチング&グループング解析してその値を変数としてproxy passに渡したい

```nginx.conf
location ~ ^/monitor/(?<server_host>(kappa|maguro|engawa).*\.localdomain)/(?<port>[0-9]+)/(?<path>.*) {
    root   html;
    index  index.html index.htm;

    proxy_set_header Host $host;
    proxy_set_header X-Real-IP $remote_addr;
    proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;

    proxy_connect_timeout 30s;
    proxy_read_timeout 30s;

    # dns
    resolver 10.252.252.252 valid=10s;
    resolver_timeout 10s;

    proxy_next_upstream error timeout http_500 http_502 http_503 http_504 non_idempotent;
    proxy_pass http://$server_host:$port/$path$is_args$args;
}
```

