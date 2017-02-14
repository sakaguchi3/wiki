# git - tag




## tagの付け方
```git
% git tag TAG_NAME
% git push --tags origin
```

## tagの削除
```git
% git tag -d TAG_NAME
% git push origin :refs/tags/TAG_NAME
または
% git push origin :TAG_NAME
または
% git push origin --delete TAG_NAME
```

## remote tag一覧の確認
```bash
git ls-remote --tags origin
```