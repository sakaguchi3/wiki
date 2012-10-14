# 言語別乱数生成


# alphabetic numeric([0-9a-zA-Z])

## bash

```bash
random=$(cat /dev/urandom | LC_CTYPE=C tr -dc "[:alnum:]" | fold -w 40 | head -n1)
echo ${random}
```
[https://github.com/sakaguchi3/shellscript_tool/...](https://github.com/sakaguchi3/shellscript_tool/blob/4caa9cc76ae195e61821f0e59f7b4cc4c987456f/sh_tool/tool.sh#L79-L82)


## java

```java
	public static String randAlphabetic(int len) {
		final var alphabetUpperCase = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";

		final var alphabetFull = alphabetUpperCase + alphabetUpperCase.toLowerCase();
		final var stringLen = alphabetFull.length();

		var sb = new StringBuilder(len);
		for (int i = 0; i < len; i++) {
			var index = RAND.nextInt(stringLen);
			var c = alphabetFull.charAt(index);
			sb.append(c);
		}
		return sb.toString();
	}
```

[https://github.com/sakaguchi3/learnJava/...](https://github.com/sakaguchi3/learnJava/blob/be97103363ff4e761d69e296438b743397356db3/jbatch002/src/main/java/com/github/sakaguchi3/util/UtilRandom.java#L57-L70)

## python

```python
def random_alphanumeric(length: int) -> str:
    import random
    import string

    letters = string.ascii_letters + string.digits
    random_str = ''.join(random.choice(letters) for i in range(length))
    return random_str
```

[https://github.com/sakaguchi3/learnPython/...]( https://github.com/sakaguchi3/learnPython/blob/00e46aaa1d01c5a921abd65f941d5caa4aee3d00/python_learn/random_gen.py#L10-L22 )




