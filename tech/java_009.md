# java - java - guava Cache


## pom

```xml
<dependency>
	<groupId>com.google.guava</groupId>
	<artifactId>guava</artifactId>
	<version>28.1-jre</version>
</dependency>
```

## sample code


Cache: 有効期限付きMap


```java
@Test
public void cacheExpireTest() throws InterruptedException {   
	var cache = CacheBuilder.newBuilder() //
			.expireAfterWrite(2, TimeUnit.SECONDS) // reflesh inverval
			.build();

	cache.put("k1", "v1");
	var v2 = cache.getIfPresent("k1");
	assertThat(v2, is("v1"));

	TimeUnit.SECONDS.sleep(3);

	// null
	var v3 = cache.getIfPresent("k1");
	assertThat(v3, nullValue());
}
```


LoadingCache: キャッシュに存在しなければデータを取ってくる

```java
@Test
public void loadCacheTest() throws ExecutionException {
	ImmutableMap<String, String> data = ImmutableMap.<String, String>builder() 
	    .put("k1", "v1") 
	    .build();

	var cache = CacheBuilder.newBuilder() //
			.maximumSize(3) // cache size
			.expireAfterWrite(10, TimeUnit.MINUTES) // interval
			.build(new CacheLoader<String, String>() {
				public String load(String key) throws Exception {
					var v = data.get(key);
					return v;
				}
			});

	// データ取得できる"v1"
	var v1 = cache.get("k1");

	// null
	var nullVal = cache.getIfPresent("key_nothing");
	
	// throw InvalidCacheLoadException. データが存在しない.
	var val2 = cache.get("key_nothing");
}
```
