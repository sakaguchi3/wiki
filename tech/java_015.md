# java - ベンチマーク 


```java
	// 統計情報
	DescriptiveStatistics stat = new DescriptiveStatistics(); 
	// 重いタスク
	final Runnable heavyTask = () -> {
		try {
			TimeUnit.MILLISECONDS.sleep(3);
		} catch (Exception e) {
		}
	}; 
```

### 20回に1回確実に出力する 
```java
	@Test
	public void benchMark2Test() {
		var atom = new AtomicInteger();
		/** Logging 1 out of cnt times | 5% (&hArr; 100/5 = 1 out of 20) */
		IntPredicate isTrueByCnt = cnt -> {
			var _cnt = atom.getAndIncrement();
			return ((_cnt % cnt) == 0);
		}; 
		stat.clear();
		stat.setWindowSize(1000);

		var sw = StopWatch.createStarted();
		for (long i = 0; i < 100; i++) {
			// hevy task
			heavyTask.run();

			long time = sw.getTime(TimeUnit.MICROSECONDS);
			stat.addValue(time);

			// 5%の確率でlog出力(<=>100/5=20回に1回)
			if (isTrueByCnt.test(100 / 5)) {
				System.out.println("Log - " + ", time:" + time + ", stopwatch:" + sw + ", stat:" + stat);
			}
			sw.reset();
			sw.start();
		}
		var p75 = stat.getPercentile(75);
		var p99 = stat.getPercentile(99);
		System.out.println(stat + "75percentile:" + p75 + "\n99percentile:" + p99);
	} 
```


### 5%の確率でログ出力する

```java
	@Test
	public void benchMark1Test() {
		var rand = ThreadLocalRandom.current();
		/** Logging with probability p | 5% (&hArr; 100/5 = 1 out of 20) */
		IntPredicate isTruePercent = p -> (rand.nextInt(100) <= p);

		stat.clear();
		stat.setWindowSize(100);
		var sw = StopWatch.createStarted();
		for (long i = 0; i < 100; i++) {
			// hevy task
			heavyTask.run();
			long time = sw.getTime(TimeUnit.MICROSECONDS);
			stat.addValue(time);
			// 20回に1回log出力(<=>100/20=5%)
			if (isTruePercent.test(100 / 20)) {
				System.out.println("Log - " + ", time:" + time + ", stopwatch:" + sw + ", stat:" + stat);
			}
			sw.reset();
			sw.start();
		}
		var p75 = stat.getPercentile(75);
		var p99 = stat.getPercentile(99);
		System.out.println(stat + "75percentile:" + p75 + "\n99percentile:" + p99);
	} 
```

結果
```text
DescriptiveStatistics:
n: 100
min: 3042.0
max: 7113.0
mean: 3670.72
std dev: 477.3493538872403
median: 3813.0
skewness: 3.5486909921513785
kurtosis: 26.409488603889987
75percentile:3927.0
99percentile:7081.519999999984
```

