# python 標準出力



### いろいろな標準出力

```python
i100 = 100
i200 = 200
print('答え:{0}, 答え:{1}'.format(i100, i200))
print('答え:%s, 答え:%d' % (i100, i200))    // 0番目は文字列，1番目は整数として解釈されるっぽい
print('答え:' + str(i100) + ", " + '答え:' + str(i200))
```

## osやpythonバージョン出力

pythonバージョン

```python:python3.7
//3.7   
print(sys.version_info)
sys.version_info(major=3, minor=7, micro=1, releaselevel='final', serial=0)
```


```python
print(os.name)
posix // linux, macなど
nt  // windows
```
