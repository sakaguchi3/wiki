# java - Collection#contains


idが同じだったら同じobjectだというルールにする
```java
	private static class MyClass {
		final int id;
		int tmpNo;

		public static MyClass of(int id, int tmpNo) {
			var o = new MyClass(id);
			o.tmpNo = tmpNo;
			return o;
		}

		private MyClass(int id) {
			this.id = id;
		}

		@Override
		public boolean equals(Object o) {
			return Optional.ofNullable(o) //
					.filter(v -> v instanceof MyClass) //
					.map(v -> (MyClass) v) //
					.filter(v -> Objects.equal(this.id, v.id)) //
					.isPresent();
		}
	}
```

`id`が等しいときは`List#contains`がtrueになる。
```java
	@Test
	public void listContainTest() {
		var l = List.of( //
				MyClass.of(3, 3), //
				MyClass.of(4, 4), //
				MyClass.of(5, 5), //
				MyClass.of(6, 6), //
				MyClass.of(7, 7) //
		); 
		assertTrue(l.contains(MyClass.of(3, -1)));
		assertFalse(l.contains(MyClass.of(-1, 3)));
	} 
```