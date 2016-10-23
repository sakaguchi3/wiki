# Java - ジェネリクス


#### PECS

引数からデータを取り出す系はextends, 引数にデータをputする系はsuperになる．
* 引数の変数.get() → extends
* 引数の変数.put(xxxx) → super


```java
	/**
	 * producer: 引数を取り出す
	 */
	public void produce(final List<? extends T> src) {
		for (T e : src) {
			stack.add(e);
		}
	}

	/**
	 * consumer: 引数に値を入れる
	 * 
	 * @param dst
	 */
	public void consume(final List<? super T> dst) {
		while (!isEmpty()) {
			dst.add(pop());
		}
	}
```
https://github.com/sakaguchi3/reinventing_the_wheel/blob/4619259c7c4f7c96980e2ad9feff0394ee5af0d2/java/src/main/java/jp/github/ushi/main/generics/Generics04.java#L24-L42

