# jMeter 


## 負荷テスト側で設定しておきたいもの

* request
    * HTTP Header Manger
* rsponse
    * JSON Assertion
    * Save Response to a file
    * View Result Tree
    * View Results in Table
    
## monitor

* jp@gc - Transactions per Second
* jp@gc - Response Times Over Time
* Aggregate Graph
* View Result Tree

* jp@gc - Active Trheads Over time  
* jp@gc - PerfMon Metrics Collector


## コマンドラインからの実行

```bash
bash /usr/local/apache-jmeter-5.2.1/bin/jmeter.sh -n \
  -t /home/user/work/jmeter-result/t01.jmx \
  -l /home/user/work/jmeter-result/d_result/result_no_t01.jtl \
  -Jjmeter.save.saveservice.output_format=xml \
  -Jjmeter.save.saveservice.response_data=true \
  -Jjmeter.save.saveservice.samplerData=true \
  -Jjmeter.save.saveservice.requestHeaders=true \
  -Jjmeter.save.saveservice.url=true \
  -Jjmeter.save.saveservice.responseHeaders=true \
```