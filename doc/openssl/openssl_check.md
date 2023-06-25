# openssl 証明書の中身を確認する

```bash
openssl req -noout -text -in server.csr
openssl req -noout -text -in private.key
```

```bash
host=google.com
```

中間CAのチェック。
depth=2 -> 1 -> 0となっていればOK.

```bash
openssl s_client -connect "$host" -quiet 

depth=2 C = US, O = Google Trust Services LLC, CN = GTS Root R1
verify return:1
depth=1 C = US, O = Google Trust Services LLC, CN = GTS CA 1C3
verify return:1
depth=0 CN = *.go
```

この様になっていると中間CAの設定が間違ってる

```bash
openssl s_client -connect google.com:443 -quiet

depth=0 CN = google.com
verify error:num=20:unable to get local issuer certificate
verify return:1
depth=0 CN = google.com
verify error:num=21:unable to verify the first certificate
verify return:1
depth=0 CN = google.com
verify return:1
```

証明書の詳細確認

```bash
openssl s_client -connect "$host":443  < /dev/null | less
```

プロトコル指定

```bash
openssl s_client -connect "$host":443 -ssl3
openssl s_client -connect "$host":443 -tls1
```

<!--
```bash
```

-->