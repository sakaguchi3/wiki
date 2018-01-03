# java - 乱数


# 一定の確率でtrueを返す

```java
	private static final ThreadLocalRandom RAND = ThreadLocalRandom.current();

	public static boolean randomTrue(int percent) {
		if (100 <= percent) {
			return true;
		}
		if (percent <= 0) {
			return false;
		}
		final int randInt = RAND.nextInt(100);
		return (randInt <= percent);
	} 
```

実行例
```java
	public static void main(String[] a) {
		if (randomTrue(10)) {
			// 10%の確率で実行される
		}
	}
```

