# MyBatis - “Table name pattern can not be NULL or empty”in javaが起きた時の話

## TL;DR

MyBatis + connector /j 6.0 だとこのエラーが起きた．

```
 “Table name pattern can not be NULL or empty” in java
```


## 対策

### 対策１
connector / j 5.x を使う

### 対策2 

DBのURL末尾に以下を付け足す
```
&nullNamePatternMatchesAll=true
```
