# Scala - scalaメモ



### コレクションメソッド
http://www.ne.jp/asahi/hishidama/home/tech/scala/collection/method.html



### 関数

#### 関数の定義
```scala
def 関数名(引数名:引数の型, …) : 戻り型 = 本体
``` 
```scala
  def isprime(num: Int): Boolean = {
    val root: Int = math.ceil(math.sqrt(num)).toInt
    val ret = (2 to root).find(v => num % v == 0)
    ret.isEmpty
  }
```



#### 関数リテラル(≒ラムダ式)

```scala
(引数名:引数の型, …) => 本体 : 戻り型
```
```scala
  (num: Int) => {
    val root: Int = math.ceil(math.sqrt(num)).toInt
    val ret = (2 to root).find(v => num % v == 0)
    ret.isEmpty
  }: Boolean
```

リテラルなので変数に代入することもできる
```scala
  val isprime: (Int => Boolean) = (num: Int) => {
    val root: Int = math.ceil(math.sqrt(num)).toInt
    val ret = (2 to root).find(v => num % v == 0)
    ret.isEmpty
  }: Boolean  
```

### implict
「暗黙的に何かをしてくれる」もの．
```scala
// 暗黙的な値を定義しておく
scala> implicit val iv: Int = 123 //暗黙の値を定義
iv: Int = 123

// mは省略可能な引数として扱える．もし省略された場合は暗黙的な定義(i.e. 123)が呼び出される．
scala> def f(n:Int)(implicit m:Int) = n + m
f: (n: Int)(implicit m: Int)Int

scala> f(5)
res1: Int = 128
```

* http://www.ne.jp/asahi/hishidama/home/tech/scala/def.html#implicitly
* https://qiita.com/miyatin0212/items/f70cf68e89e4367fcf2e


### Trait

```scala
trait A {
  val a1:Int //抽象メンバー
  val a2:Int //抽象メンバー
  val sum = a1 + a2
  println("A" + (a1, a2, sum))
}
```

初期化．
```scala
class C extends A {
  val a1 = 123
  val a2 = 456
  println("C" + (a1, a2 ,sum))
}

scala> new C().sum
A(0,0,0)
C(123,456,0)
res5: Int = 0
```
withを使うと初期化順を変えられる．
```scala
class C extends { //事前初期化
  val a1 = 123
  val a2 = 456
  val dummy = println("C" + (a1, a2))
} with A

scala> new C().sum
C(123,456)
A(123,456,579)
res6: Int = 579
```
* http://www.ne.jp/asahi/hishidama/home/tech/scala/trait.html



### Object

「静的」ではなく「シングルトン」であるということ。  
シングルトンオブジェクトはあくまで（唯一の）オブジェクトなのであって，そのメンバー（フィールド・メソッド）は静的なメンバーではない。

* http://www.ne.jp/asahi/hishidama/home/tech/scala/object.html


### 文字列
エスケープ文字「\」
```scala
scala> "ab\ncd"
res1: java.lang.String =
ab
cd
```
「生文字リテラル（raw string literal）」
```scala
scala> """ab\ncd"""
res3: java.lang.String = ab\ncd
```

### for
基本構文．式だが値なしのUnit型を返す．  
「変数 ``` <-``` コレクション」をジェネレータと呼ぶ．
```scala
for (変数 <- コレクション) 式
```

```scala
for (i:Int <- list) println(i)
```

繰り返し系のシンタックスシュガー
```scala
for (i <- 1 to 10) {
  println(i)
}
```
```scala
for (i <- Range(1, 10)) println(i)
```
これはforじゃないので，ちょっと扱いが違うかもしれないけど結果は同じ
```scala
(0 to 10).foreach(println)
```

フィルタ
```scala
for (i <- 0 until 10 if i % 2 == 0) println(i)
```
```scala
for (i <- 0 until 10 if i%2==0; if i%3==0) println(i)
```

for式はUnit型を返すが，yeildをつけると演算結果を返すことが可能になる．
```scala
scala> for (i <- 1 to 5) yield i
res4: scala.collection.immutable.IndexedSeq[Int] = Vector(1, 2, 3, 4, 5)
```

* http://www.ne.jp/asahi/hishidama/home/tech/scala/for.html



### case
基本構文．式なので値を返す．
```scala
値 match {
  case パターン1 => 処理1
  case パターン2 => 処理2
～
}
```

```scala
var n = 1

val s:String = n match {
  case 1 => "いち"
  case 2 => "に"
  case 3 => "さん"
  case _ => "たくさん"
}
```
ガード条件
```scala
  n match {
    case m if m <  0 => "なにそれ"
    case 0           => "ない"
    case m if m <= 3 => "数えられる"
    case _           => "たくさん"
  }
```


### Option(Some/None)

```scala
def div(n: Int, m: Int) = {
   if (m != 0) Some(n / m) 
   else None
}
```

* http://www.ne.jp/asahi/hishidama/home/tech/scala/option.html


### Scala Dynamic

フィールドアクセスで値の取得/更新ができる．

定義
```scala
class MyMap extends Dynamic {
  val map = Map("abc"->123, "def"->456, "ghi"->789)

  def selectDynamic(key: String): Int = {
    map.getOrElse(key, 0)
  }
}
```

実行
```scala
scala> val m = new MyMap
m: MyMap = MyMap@13882c0

scala> m.selectDynamic("abc")
res12: Int = 123

scala> m.abc
res13: Int = 123

scala> m.zzz
res14: Int = 0
```


### scalaファイル操作

```scala
try {
  var line = ""
  while ({ line = br.readLine(); line ne null }) {
    println(line)
  }
} finally {
  br.close()
}
```

scalaっぽく

```scala
val br = new BufferedReader(new InputStreamReader(new FileInputStream("ファイル名"), "MS932"))
val list = try {
    Iterator.continually(br.readLine()).takeWhile(_ != null).toList
  } finally {
    br.close()
  }
println(list) //読み込んだ内容を使う
```

* http://www.ne.jp/asahi/hishidama/home/tech/scala/file.html


### コンパニオンオブジェクト
object と classが両方定義されているやつ．
applyメソッドを実装して，クラスインスタンスの作成をさせたりする(i.e.いわゆるファクトリーメソッド)．
```scala
class Example {
}

object Example {
}
```


