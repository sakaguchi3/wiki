# rm - 「zsh: 引数リストが長すぎます: rm」 が出たときの対処法


## TL;DR

```bash
rm ./hogedir
zsh: 引数リストが長すぎます: rm
```
ファイルが多すぎるとエラーが出る


## 対処法

```bash
find ./xml  -type f -name "*.xml"  | xargs rm
```
