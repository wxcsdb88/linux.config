# pip sources

## Using a mirror

### Single Usage:
```
pip install -i https://<mirror>/simple <package>
```

### Global settings:
Add ~/.pip/pip.conf that includes:
```
[global]
trusted-host =  mirror
index-url = https://<mirror>/simple
```

## pypi mirrors
```
https://pypi.python.org/pypi San Francisco, California US
https://pypi.doubanio.com/ Beijing, Beijing CN
https://pypi.fcio.net/ Oberhausen, Nordrhein-Westfalen DE
https://mirrors.aliyun.com/pypi Hangzhou, Zhejiang CN
https://pypi.mirrors.ustc.edu.cn/ Hefei, Anhui CN
https://pypi.tuna.tsinghua.edu.cn/ Beijing, Beijing CN
```
