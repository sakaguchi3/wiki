# java - jsonを扱う

# library

```xml
		<dependency>
			<groupId>com.fasterxml.jackson.module</groupId>
			<artifactId>jackson-module-parameter-names</artifactId>
			<version>2.9.8</version>
		</dependency>
```

# serialize

```java
// deserialize時に、存在しない値があった場合無視すする
@JsonIgnoreProperties(ignoreUnknown=true)
public class Pojo{
    // serialize時にjson出力しない値
    @JsonIgnore
    Logger log;

    // フィールドは全部publicにしておく
	public int num;
	public String msg;
	public List<String> strLst;

	// deserialize時には空constructorが必要
	public Pojo() {
	}

	public PojoPublic(int num, String msg, List<String> strLst) {
		super();
		this.num = num;
		this.msg = msg;
		this.strLst = strLst;
	}

}
```

```java
	void json1Test() throws IOException {
		var mapper = new ObjectMapper()
				.setSerializationInclusion(Include.NON_EMPTY);

		var data = new Pojo(3, null, List.of());
		
		// null or emptyは無視する(今回の場合だとmsg, strLst)
		var json = mapper.writeValueAsString(data);
        // ==> {"num":3}
	}
```


# deserialize

```java
	void json1Test() throws IOException {
		var mapper = new ObjectMapper()
				.setSerializationInclusion(Include.NON_EMPTY);
        var json = "{\"num\":3}";
		var obj = mapper.readValue(json, Pojo.class);
	}
```

