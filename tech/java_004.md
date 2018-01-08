# java - scalaのzipみたいなのをjavaで使う


## pom

vavr

```pom.xml
		<dependency>
			<groupId>io.vavr</groupId>
			<artifactId>vavr</artifactId>
			<version>0.10.3</version> 
		</dependency
```

guava 

```pom.xml
		<dependency>
			<groupId>com.google.guava</groupId>
			<artifactId>guava</artifactId>
			<version>29.0-jre</version>
		</dependency> 
```


## vavrを使ったzip

```java
	@Test
	public void zipByVavrTest() {
		var names = ImmutableList.of("Alice", "Bob", "Charles", "Dragon");
		var ages = ImmutableList.of(42, 27, 31);
		List<Tuple2<String, Integer>> tuples = Stream //
				.ofAll(names) //
				.zip(ages) //
				.toJavaList();

		// [(Alice, 42), (Bob, 27), (Charles, 31)]
		tuples.forEach(v -> System.out.println(v));
	} 
```


## guavaを使ったzip

```java
	@Test
	public void zipByGuavaTest() {
		var names = ImmutableList.of("Alice", "Bob", "Charles", "Dragon");
		var ages = ImmutableList.of(42, 27, 31);
		List<Tuple2<String, Integer>> tuples = Streams //
				.zip(names.stream(), ages.stream(), Tuple::of) //
				.collect(ImmutableList.toImmutableList());

		// [(Alice, 42), (Bob, 27), (Charles, 31)]
		tuples.forEach(v -> System.out.println(v));
	} 
```



## 出力結果

```bash
(Alice,42)
(Bob,27)
(Charles,31)
```