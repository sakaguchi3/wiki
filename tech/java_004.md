# java - scalaのzipみたいなのをjavaで使う


必要なlibrary
* guava
    * zipメソッド
* commons lang
    * Pair(tupleっぽいもの)

## pom

```pom
		<dependency>
			<groupId>org.apache.commons</groupId>
			<artifactId>commons-lang3</artifactId>
			<version>3.8.1</version>
		</dependency>
		<dependency>
			<groupId>com.google.guava</groupId>
			<artifactId>guava</artifactId>
			<version>27.1-jre</version>
		</dependency>
```

## java

```java
import org.apache.commons.lang3.tuple.ImmutablePair;

import com.google.common.collect.ImmutableList;
import com.google.common.collect.Streams;

public class ZipTest {

	void exec() {

		var names = ImmutableList.of("Alice", "Bob", "Charles", "Dragon");
		var ages = ImmutableList.of(42, 27, 31);

		var tuples = Streams //
				.zip(names.stream(), ages.stream(), ImmutablePair::new) // (String, Int) -> Pair
				.collect(ImmutableList.toImmutableList()) // Pair -> (reduction) -> List<Pair>
		;

		tuples.stream() //
				.map(ImmutablePair::toString) // Pair -> String
				.forEach(System.out::println) //
		;

	}

}

```


```bash
(Alice,42)
(Bob,27)
(Charles,31)
```