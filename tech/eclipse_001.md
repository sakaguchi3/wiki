# eclipse - eclipse - 日本語コメントの文字化けを直す


## TL;DR
eclipse201812にしたら日本語から始まるコメントが文字化けするようになった．   
フォントをcicaに変更したら治った．


### 事前準備

以下からフォントをDLしてインストールする。
* https://github.com/miiton/Cica


### やり方

![PNG](/tech/dir/eclipse_001/image001.png)

eclipse201812だと日本語から始まるコメントが文字化けを起こす


![PNG](/tech/dir/eclipse_001/image002.png)

Windows→Preferences→Colors and Fonts→Java Editor Text Font→Edit


![PNG](/tech/dir/eclipse_001/image003.png)

フォント名にCicaを選ぶ．   
Cicaフォントだと文字が小さくなるので，サイズは11くらいにしたほうがいいかも．
