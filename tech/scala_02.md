# Scala - Functor/Applicative/Monad



### Functor

型
```haskell
fmap :: (a->b) -> fa -> fb
```


例
```haskell
> fmap (+3) (Just 2)
Just 5
```


### Applicative


型のイメージ
```haskell
f(a->b) -> fa -> fb
```


例

```haskell
> Just (+3) <*> Just 2 == Just 5
Just 5
```




### Monad


型
```haskell
class Monad m where    
    (>>=) :: m a -> (a -> m b) -> m b  
```


例
```haskell
half x = if even x
           then Just (x `div` 2)
           else Nothing

> Just 3 >>= half
Nothing           
```



### 参考
* [箱で考えるFunctor、ApplicativeそしてMonad](https://qiita.com/suin/items/0255f0637921dcdfe83b)
* ["圏論とかモナドなんて簡単だからscalaを使って説明してみた"を検証してみた](http://hiratara.hatenadiary.jp/entry/20130404/1365079419)
* [圏論とかモナドなんて簡単だからscalaを使って説明してみた](http://rirakkumya.hatenablog.com/entry/2013/03/31/191056)
* [関数型つまみ食い: モナドが難しいと思われている理由](https://ubiteku.oinker.me/2016/01/20/%E9%96%A2%E6%95%B0%E5%9E%8B%E3%81%A4%E3%81%BE%E3%81%BF%E9%A3%9F%E3%81%84-%E3%83%A2%E3%83%8A%E3%83%89%E3%81%8C%E9%9B%A3%E3%81%97%E3%81%84%E3%81%A8%E6%80%9D%E3%82%8F%E3%82%8C%E3%81%A6%E3%81%84%E3%82%8B/)
* [[Scala][モナド][備忘録]ScalaでモナドAdd Star](http://d.hatena.ne.jp/papamitra/20101002/scala_monad)
* [Functor(関手)ってなんですか？](http://south37.hatenablog.com/entry/2014/03/25/Functor%E3%81%A3%E3%81%A6%E3%81%AA%E3%82%93%E3%81%A7%E3%81%99%E3%81%8B%EF%BC%9F)
* [モナドを理解する - 迷える者への手引き](https://www.infoq.com/jp/articles/Understanding-Monads-guide-for-perplexed)
* [独習 Scalaz — モナドがいっぱい ](http://eed3si9n.com/learning-scalaz/ja/Monad.html)
* [独習 Scalaz — 9日目 ](http://eed3si9n.com/learning-scalaz/ja/Making-monads.html)
* [Scalaで関数型プログラミングをする#3 圏論を学ぶ(前)](https://dev.classmethod.jp/etc/func-program3/)
* [Scalaで圏論入門を見ながら圏論を勉強(前編)](http://d.hatena.ne.jp/sy-2010/20130419)
* [Scalaで圏論入門を見ながら圏論を勉強(中編)](http://d.hatena.ne.jp/sy-2010/20130426)
* [恒等射（同一矢）とはなんであるかをもう一度考える](http://math.artet.net/?eid=1305876)
 
