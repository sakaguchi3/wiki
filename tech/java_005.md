# vavr - 関数型プログラミング in Java




##  vavr

maven

```xml
<dependency>
	<groupId>io.vavr</groupId>
	<artifactId>vavr</artifactId>
	<version>0.10.0</version>
</dependency>
```




### Try.of

```java
byte[] data = makeData();
Try<String> result = Try.of(() -> post(data));
```


### case


import

```java
import static io.vavr.API.$;
import static io.vavr.API.Case;
import static io.vavr.API.Match;
import static io.vavr.Predicates.instanceOf
```


```java
IOException e = Match(new IOException()).of(//
		Case($(instanceOf(IOException.class)), t -> t), //
		Case($(), t -> new IOException(t.toString())) //
	);
```

