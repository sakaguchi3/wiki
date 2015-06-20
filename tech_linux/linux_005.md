# Linux - 監視コマンド


### コマンド

| コマンド | 機能 | |
|--|--|--|
|vmstat 2  | cpu, memory, disk-io などを監視   |   |
|dstat 2  | vmstatの拡張版．トラフィックの監視とかもできる．  |   |
|sar  |過去の負荷の履歴   |   |

<!--
|  |   |   |
-->




### disk io チェック


```bash
sar -d -p
iostat -dmxt 1
vmstat 1
sar -u
vmstat -d 
sar -b
```

過去のログを確認する
```bash
$ cd /var/log/sa
$ sar -b -f sa01
```

apacheのlogからリクエスト数を調べる

```bash
  grep  "08/Jul"   virtual-ssl-access_log-20200712 | wc -l
```



### memo

```bash
vmstat 5 -unit M
```

### 参考
* [Linux負荷監視コマンドまとめ](https://qiita.com/aosho235/items/c4d6995743dd1dac16e1)