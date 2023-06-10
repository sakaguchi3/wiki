# shell scriptでパターンマッチング, tag:pattern,match

* `${<変数>##<pattern>}`
  * headから検索してpatternを削除。
* `${<変数>%%<pattern>}`
  * tailから検索してatternを削除。

## sample

head を削除

```bash
_a="____head/f7fa44c3-fbfc-aaa-ac52-b49b01163898/tail____"
_a=${_a##*head/}
echo $_a

f7fa44c3-fbfc-aaa-ac52-b49b01163898/tail____
```

tailを削除

```bash
_a="____head/f7fa44c3-fbfc-aaa-ac52-b49b01163898/tail____"
_a=${_a%%/tail*}
echo $_a

____head/f7fa44c3-fbfc-aaa-ac52-b49b01163898

```

組み合わせ

```bash
_a="____head/f7fa44c3-fbfc-aaa-ac52-b49b01163898/tail____"
_a=${_a##*head/}
_a=${_a%%/tail*}
echo $_a

f7fa44c3-fbfc-4aa8-ac52-b46b01163898
```
