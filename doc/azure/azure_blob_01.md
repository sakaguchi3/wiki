# azure cli - azコマンドでblobを操作する

[az cli - az storage documentation](https://learn.microsoft.com/en-us/cli/azure/storage/azcopy?view=azure-cli-latest)

## download
ファイル1個をダウンロードする。
```bash
az storage blob \
 download \
 --account-name <name> \
 --container-name <container> \
 --sas-token <token> \
 -n <src_file_name> \
 -f <dst_file_name> 
```
## download-batch
パターンマッチやディレクトリ単位など、複数ファイルを一括でダウンロードする。
```bash
az storage blob download-batch \
 -d <loal_dir>  \
 --account-name <name> \
 -s <container> \
 --pattern <pattern | *.dat>  \
 --sas-token <token> 
```

## upload
```bash
az storage blob \
 upload \
 --account-name <name> \
 --container-name <container> \
 --sas-token <token> \
 -n <src_file_name> \
 -f <dst_file_name> 
```


## az delete 
```bash
az storage blob delete \
 --account-name <name> \
 --container-name <container> \
 --sas-token <token> \
 -n <src_file_name> 
```
