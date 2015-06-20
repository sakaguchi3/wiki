# java - apache commons math3


## pom

```xml
<dependency>
	<groupId>org.apache.commons</groupId>
	<artifactId>commons-math3</artifactId>
	<version>3.6.1</version>
</dependency>
```

## sample code - 統計情報を計算 

* DescriptiveStatistics: 
* SynchronizedDescriptiveStatistics: thread safe

```java
@Test
public void aaaTest() {
	var stats = new DescriptiveStatistics();
	IntStream.range(0, 10) //
		.mapToDouble(__ -> Math.random()) //
		.forEach(stats::addValue);
	// 75% line
	var p75 = stats.getPercentile(75);
	// 95% line
	var p95 = stats.getPercentile(95);

	log.info(stats + ", 75%:" + p75 + ", 90%:" + p95);
}
```

