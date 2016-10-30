# vagrant - boxファイルのexport/import

### boxファイルのexport

```bash
$vagrant package hogehogeimage --output hogehogeimage.box
```



### boxファイルのimport

```
$vagrant box add hogehogeimage hogehogeimage.box
$vagrant box list
$vagrant init hogehogeimage
$vagrant up
```


### 参考
http://vdeep.net/vagrant-package
