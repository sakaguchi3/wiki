# java - ExecutorService

```java
var threadPool = Executors.newCachedThreadPool();

Runnable r = () -> {
    // heavy task
};
threadPool.submit(r);
threadPool.execute(r);

// 終了処理
threadPool.shutdown();
threadPool.awaitTermination(500, TimeUnit.MICROSECONDS);
threadPool.shutdownNow(); // throw InterruptedException
```