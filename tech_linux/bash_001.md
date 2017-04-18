# bash script


### case

```bash
case "$var" in
  a* ) echo "aで始まる文字列" ;;
  ?b* ) echo "2文字目がbの文字列" ;;
  [A-Z]* ) echo "大文字で始まる文字列" ;;
  [!xX]* ) echo "先頭がxではない文字列" ;;
  * ) echo "上記のいずれでもない文字列" ;;
esac
```
https://shellscript.sunone.me/case.html