# group

## グループ作成/削除

作成

```bash
groupadd testgrp1
```

削除

```bash
groupdel testgrp1
```

## グループにユーザを追加

追加

```bash
usermod -aG <group> <user>
```

グループに追加されているユーザを確認

```bash
getent group <group_name>
or
less /etc/group
```

グループからユーザを削除

```bash
gpasswd -d <user> <group>
```
