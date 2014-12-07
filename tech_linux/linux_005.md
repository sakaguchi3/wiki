# Linux - 監視コマンド その他

## コマンド

| コマンド | 機能 | |
|--|--|--|
|vmstat 2  | cpu, memory, disk-io などを監視   |   |
|dstat 2  | vmstatの拡張版．トラフィックの監視とかもできる．  |   |

<!--
|  |   |   |
-->

## disk io チェック

```bash
iostat -dmxt 1
vmstat 1
vmstat -d 
```

過去のログを確認する

```bash
cd /var/log/sa
```

apacheのlogからリクエスト数を調べる

```bash
  grep  "08/Jul"   virtual-ssl-access_log-20200712 | wc -l
```

## memo

```bash
vmstat 5 -unit M
```

### 参考
* [Linux負荷監視コマンドまとめ](https://qiita.com/aosho235/items/c4d6995743dd1dac16e1)