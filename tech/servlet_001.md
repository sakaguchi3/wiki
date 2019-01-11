# servlet - HelloServlet


## TL;DR


https://qiita.com/Kazunori-Kimura/items/a15a011485ac92074d6f

ここを参考にサンプルコードを動かしてみた際の自分用のメモ


## メモ


### keyword 

* forward: servlet→jspへの転送
* setAtribute/getAtribute
    * servlet->jsp / jsp->servlet
* post: jsp->servlet ?
* get: servlet->jsp ?


### server.xml

```XML
      <Context docBase="TodoServlet" path="/TodoServlet" reloadable="false" source="org.eclipse.jst.jee.server:TodoServlet"/></Host>
```
* docBase: 保存ディレクトリ(プロジェクトの名前)
* path: アクセスするパス
    * 上記の例だと```http://localhost:8080/TodoServlet/HelloServlet``` でアクセスできる
    * ```/hogepath```に変更すると```http://localhost:8080/hogepath/HelloServlet``` でアクセスできる
    
### java
```java

/**
 * HelloServlet.java
 */
@WebServlet("/HelloServlet")
public class HelloServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public HelloServlet() {
		super();
	}
    /**
     * getはこいつが受け取る 
     */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		 String view = "/WEB-INF/view/index.jsp";
		 RequestDispatcher dispatcher = request.getRequestDispatcher(view);

		 dispatcher.forward(request, response);
	}
    /**
     * postはこいつが受け取る 
     */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		debug("postt");

		doGet(request, response);
	}
}
```    

* @WebServlet("/HelloServlet"): ```HelloServlet```を受け取ったさいの起動する
    * サンプルプロジェクトだと```http://localhost:8080/TodoServlet/HelloServlet``` でアクセスできる
    * ```FugaServlet```にすると```http://localhost:8080/TodoServlet/FugaServlet``` でアクセスできる
### PECS
