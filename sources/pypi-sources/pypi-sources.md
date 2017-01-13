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
index-url=https://<mirror>/simple
[install]
trusted-host=mirror
```
#### examples:
| source | content | desc |
|--------|---------------------------------------------------------------------------------------------------------|------|
| aliyun |[global]<br>index-url=https://mirrors.aliyun.com/pypi/simple<br>[install]<br>trusted-host=mirrors.aliyun.com|  |
| douban |[global]<br>index-url=https://pypi.doubanio.com/simple<br>[install]<br>trusted-host=pypi.doubanio.com |  |
| ustc |[global]<br>index-url=https://pypi.mirrors.ustc.edu.cn/simple<br>[install]<br>trusted-host=pypi.mirrors.ustc.edu.cn |  |
| tsinghua |[global]<br>index-url=https://pypi.tuna.tsinghua.edu.cn/simple<br>[install]<br>trusted-host=pypi.tuna.tsinghua.edu.cn |  |
| org |[global]<br>index-url=https://pypi.python.org/pypi/simple<br>[install]<br>trusted-host=pypi.python.org |  |

## pypi mirrors
```
https://pypi.python.org/pypi San Francisco, California US
https://pypi.doubanio.com/ Beijing, Beijing CN
https://pypi.fcio.net/ Oberhausen, Nordrhein-Westfalen DE
https://mirrors.aliyun.com/pypi Hangzhou, Zhejiang CN
https://pypi.mirrors.ustc.edu.cn/ Hefei, Anhui CN
https://pypi.tuna.tsinghua.edu.cn/ Beijing, Beijing CN
```
