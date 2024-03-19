# find - atime, mtime, ctime

* atime: access time
* mtime: modify time
* ctime: change time

* `find -ctime +7`: 期間 [-(7+1), ∞)
* `find -ctime  7`: 期間 [-7, -(7+1))
* `find -ctime -7`: 期間 [0, -7]

## `-daystart`

基準点を0時にできる。


