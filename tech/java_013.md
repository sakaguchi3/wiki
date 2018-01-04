# java - PriorityBlockingQueue, Comparable


### comparableを実装する

priorityが小さい順にsortするってルールにする。
```java
	class MyComparable implements Comparable<MyComparable> {
		public int priority = 0;

		public static MyComparable of(int priority) {
			var a = new MyComparable();
			a.priority = priority;
			return a;
		}

		@Override
		public int compareTo(MyComparable that) {
			return Integer.compare(this.priority, that.priority);
		}

		@Override
		public String toString() {
			return String.valueOf(priority);
		}
	}
```
compare順にデータが取り出せる
```java
	@Test
	public void myCompare4Test() throws InterruptedException {
		var pqNatural = new PriorityBlockingQueue<MyComparable>();
		var unsorted = List.of( //
				MyComparable.of(10), //
				MyComparable.of(20), //
				MyComparable.of(1), //
				MyComparable.of(90), //
				MyComparable.of(6) //
		);
		unsorted.forEach(v -> {
			pqNatural.add(v);
		});

		// 1 6 10 20 90
		while (!pqNatural.isEmpty()) {
			var aa = pqNatural.take();
			System.out.print(aa + " ");
		}
	}
```

# comparableを実装しないと


```java
	class NoMyComparable {
		public int priority = 0;

		public static NoMyComparable of(int priority) {
			var a = new NoMyComparable();
			a.priority = priority;
			return a;
		}

		@Override
		public String toString() {
			return String.valueOf(priority);
		}
	} 
```

Comparableがimplされてないと`ClassCastException`がthrowされる
```java
	@Test
	public void myCompare3Test() {
		var pq = new PriorityQueue<NoMyComparable>();
		var unsorted = List.of( //
				NoMyComparable.of(10), //
				NoMyComparable.of(20), //
				NoMyComparable.of(1), //
				NoMyComparable.of(90), //
				NoMyComparable.of(6) //
		);
		assertThrows(ClassCastException.class, () -> {
			unsorted.forEach(v -> pq.add(v));
		});
	}
```

PriorityBlockingQueueのコンストラクタで、Comparatorを渡してあげれば、comparableでなくても実行できる。
```java
	@Test
	public void myCompare5Test() throws InterruptedException {
		Comparator<NoMyComparable> compare = Comparator.comparing(t -> t.priority);
		var pq = new PriorityBlockingQueue<NoMyComparable>(10, compare);

		var unsorted = List.of( //
				NoMyComparable.of(10), //
				NoMyComparable.of(20), //
				NoMyComparable.of(1), //
				NoMyComparable.of(90), //
				NoMyComparable.of(6) //
		);
		unsorted.forEach(v -> pq.add(v));

		// 1 6 10 20 90
		while (!pq.isEmpty()) {
			var aa = pq.take();
			System.out.print(aa + " ");
			debug();
		} 
	}
```