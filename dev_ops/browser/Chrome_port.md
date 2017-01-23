## firefox / chrome 访问特定端口
### 1. firefox
FirFox打开80以外的端口，会弹出以下提示：“此地址使用了一个通常用于网络浏览以外的端口。出于安全原因，Firefox 取消了该请求。”。

solve：
```
在Firefox地址栏输入about:config，然后在右键新建一个字符串键“network.security.ports.banned.override”，值就是将需访问
网站的端口号即可如有多个，就半角逗号隔开，
例：81,88,98
在能保证安全的前提下，还简化成这样写0-65535。这样，就可以浏览任意端口的网站了。
```

### 2. chrome
chrome会提示“无法显示此网页”，详细信息为：“网址为 https://imap-mail.outlook.com:993/ 的网页可能暂时无法连接，或者它已永久性地
移动到了新网址。
错误代码：ERR_UNSAFE_PORT”。

solve：
```
右键单击Chrome快捷方式 >> 选择Properties >> 在后面添加参数：--explicitly-allowed-ports=xxx （xxx为目标端口号）
例如：C:\Program Files (x86)\Google\Chrome\Application\chrome.exe –explicitly-allowed-ports=6666
当然，也可以直接在命令窗口输入
chrome默认支持的端口有：
- HTTP: 80, 81, 1025-65535
- HTTPS: 443, 563, 8443
- FTP: 21
```
### 3. Google Chrome 默认非安全端口列表
|port|desc|----|port|desc|----|port|desc|
|:--:|:--:|:--:|:--:|:--:|:--:|:--:|:--:|
|1|tcpmux|--|7|echo|--|9|discard|
|11|systat|--|13|daytime|--|15|netstat|
|17|qotd|--|19|chargen|--|20|ftp data|
|21|ftp access|--|22|ssh|--|23|telnet|
|25|smtp|--|37|time|--|42|name|
|43|nicname|--|53|domain|--|77|priv-rjs|
|79|finger|--|87|ttylink|--|95|supdup|
|101|hostriame|--|102|iso-tsap|--|103|gppitnp|
|104|acr-nema|--|109|pop2|--|110|pop3|
|111|sunrpc|--|113|auth|--|115|sftp|
|117|uucp-path|--|119|nntp|--|123|NTP|
|135|loc-srv/epmap|--|139|netbios|--|143|imap2|
|179|BGP|--|389|ldap|--|465|smtp+ssl|
|512|print / exec|--|513|login|--|514|shell|
|515|printer|--|526|tempo|--|530|courier|
|531|chat|--|532|netnews|--|540|uucp|
|556|remotefs|--|563|nntp+ssl|--|587|stmp?|
|601| ??|--|636| ldap+ssl|--|993|ldap+ssl|
|995|pop3+ssl|--|2049|nfs|--|3659|apple-sasl/<br>PasswordServer|
|4045|lockd|--|6000|X11|--|6665|Alternate IRC<br>[Apple addition]|
|6666|Alternate IRC<br>[Apple addition]|--|6667|Alternate IRC<br>[Apple addition]|--|6668|Alternate IRC<br>[Apple addition]|
|6669|Alternate IRC<br>[Apple addition]|
