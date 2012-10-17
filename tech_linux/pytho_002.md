# aws lambda - pythonのデプロイ作成



# 必要なライブラリを用意する

ディレクトリ作成

```
mkdir deploy
cd deploy
touch hoge.py
```

ライブラリインポート
```
pip3 install -r requirements.txt -t ./
```

デプロイ作成
```
zip -r ../x.zip *
```
