# Scala - 競技プログラミング



## 入力

```scala
  val Seq(_, h) = readLine().split(" ").toSeq.map(_.toInt)
```

## コレクションに関して

### 大きい順にリストを並び替える

```scala
  val aaa = Seq(9, 100, 6, 12)
  val sort1 = aaa.sorted            // List(6, 9, 12, 100)
  val sort2 = aaa.sorted.reverse    // List(100, 12, 9, 6)
```

### ミュータブルなコレクション

```scala
  val aaa = ArraySeq(9, 100, 6, 12)
  aaa(0) = 8  
  print(aaa)  // ArraySeq(8, 100, 6, 12)
```

* http://www.ne.jp/asahi/hishidama/home/tech/scala/collection/index.html


### index取得

```scala
  val list =  ArraySeq(9, 100, 6, 6, 6, 6, 12)
  println(list.indexWhere(p => p==6))       // 2
  println(list.lastIndexWhere(p => p == 6)) // 5  
  println(list.indexWhere(p => p==2))       // -1
```
条件に合わないときは -1 が返る


### 要素の追加

```scala
 val mutableList = MutableList(9, 100, 6)
 mutableList += 3   // MutableList(9, 100, 6, 3)
 
 val arraySeq = ArraySeq(9, 100, 6, 6, 6, 6, 12)
 arraySeq += 3 // エラー．ArraySeqは配列(?)なので、要素の追加はNG．  
```

