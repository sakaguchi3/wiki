# 固定ip

## 固定ipv6設定

インタフェースのuuid取得

```bash
 nmcli connection show  
 uuid=xxxx-xxx...
```

ipv6設定

```bash
 ipv6="xxxx:xxxx:..."
 nmcli connection modify $uuid +ipv6.addresses "$ipv6/64"  ipv6.route-metric 50
 nmcli connection up $uuid 
```

## ipv6削除

```bash
 nmcli connection modify $uuid -ipv6.addresses "$ipv6/64" 
 nmcli connection up $uuid                                                                                                                  
```
