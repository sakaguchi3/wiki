# java - guava ImmutableCollection


## pom

```xml
<dependency>
	<groupId>org.apache.commons</groupId>
	<artifactId>commons-math3</artifactId>
	<version>3.6.1</version>
</dependency>
```

## sample code


```java
ImmutableMap<String, String> data = ImmutableMap.<String, String>builder() //
		.put("k1", "v1") 
		.put("k2", "v2") 
		.put("k3", "v3") 
		.build(); 
```
