# firewalld

## port80を開ける
```bash
% sudo firewall-cmd --permanent --zone=public --add-service=http
success
% sudo firewall-cmd --permanent --zone=public --add-service=https
success
% sudo firewall-cmd --reload
success
```

## zoneに登録されている内容を確認
```bash
firewall-cmd --list-all-zones
```