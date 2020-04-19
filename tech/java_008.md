# java - 証明書エラーを無理やり回避する

この処理をやってもうまく行かない場合がある。



## 無効化処理

```java
	/**
	 * Avoid checking the validity of the ssl certificate. Accept any certificate,
	 * regardless of issuer and host. This can be done by installing a custom
	 * TrustManager and a HostnameVerifier.
	 * 
	 * @throws NoSuchAlgorithmException
	 * @throws KeyManagementException
	 */
	private void notValidateCertificateChain() throws NoSuchAlgorithmException, KeyManagementException {

		// Create a trust manager that does not validate certificate chains
		X509TrustManager x509TrustManager = new X509TrustManager() {
			public java.security.cert.X509Certificate[] getAcceptedIssuers() {
				return null;
			}

			public void checkClientTrusted(X509Certificate[] certs, String authType) {
			}

			public void checkServerTrusted(X509Certificate[] certs, String authType) {
			}
		};
		TrustManager[] trustAllCerts = new TrustManager[] { x509TrustManager };

		// Install the all-trusting trust manager
		SSLContext sc = SSLContext.getInstance("TLSv1.1");
		sc.init(null, trustAllCerts, new SecureRandom());
		HttpsURLConnection.setDefaultSSLSocketFactory(sc.getSocketFactory());

		// Create all-trusting host name verifier
		HostnameVerifier allHostsValid = new HostnameVerifier() {
			public boolean verify(String hostname, SSLSession session) {
				return true;
			}
		};

		// Install the all-trusting host verifier
		HttpsURLConnection.setDefaultHostnameVerifier(allHostsValid);

	}
```


## 起動処理で呼び出す

```java
	@Override
	public void contextInitialized(ServletContextEvent event) {
		notValidateCertificateChain();
	}
```