# useradd, ユーザの追加

## ユーザ作成

user1を追加してホームディレクトリを作成。

```bash
useradd user1 -m
```

centosの場合は `-m` がなくてもホームディレクトリが作成できた。

```bash
useradd user1
```

ホームディレクトリの作成場所を指定する。
`/var/home/user1` にする例。

```bash
useradd user1 -m -d /var/home/user1
```

## ユーザ作成+グループを追加

* `-g` : プライマリグループに追加
* `-G` : セカンダリグループに追加。`,`区切りで複数指定することも可能。

## ユーザ削除

ユーザを削除するが、ホームディレクトリは残しておく。

```bash
userdel user1
```

ユーザを削除して、ホームディレクトリも削除する

```bash
userdel user1 -r
```
