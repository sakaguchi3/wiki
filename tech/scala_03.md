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

### 任意のコレクションサイズを作り、初期値を設定する

```scala
  val bookshelf = Array.fill(25)(0) // 25個の要素を用意して、0で初期化
```


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

## 演算

### 三項演算子

```scala
val k1=4 
val k2=3
val max = if (k1 < k2) k2 else k1

```

## ループ

### 多重ループ

```scala
  // ネストしたループ
  for (i <- 1 to 9) {
    for (j <- 1 to 9) {
      print(i * j)
    }
  }
  // ネストを浅く表現できる
  for (i <- 1 to 9; j <- 1 to 9) {
    print(i * j)
  }
```

### 偶数だけ表示

```scala
  for (i <- 1 to 10 if i % 2 == 0) {
    println(i)
  }
  // 2, 4, 6, 8, 10
```

### break


```scala
  import scala.util.control.Breaks._
  breakable {
    for (i <- 1 to 10) {
      if (i > 4) break // break out of the for loop
      println(i)
    }
  }
  // 1, 2, 3, 4
```

```scala
  val searchMe = "peter piper picked a peck of pickled peppers"
  var numPs = 0
  for (i <- 0 until searchMe.length) {
    breakable {
      if (searchMe.charAt(i) != 'p') {
        break
      } else {
        numPs += 1
      }
    }
  }
  println(numPs)  // 9
```
