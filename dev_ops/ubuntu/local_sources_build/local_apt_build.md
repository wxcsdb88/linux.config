# ***local apt sources build***
-----
##### tips:
*need least disk space 350 GB+*
### install apt-mirror
```
# you must update the sources.list first
sudo apt-get update
sudo apt-get install apt-mirror
```
After the apt-mirror installed, you\`ll find the mirror.list in `/etc/apt/mirror.list`.

The content of it, as follows:
>common you need only modify base_path, sources from info

```
############# config ##################
# 配置数据基目录
# set base_path    /var/spool/apt-mirror

# 配置镜像存储位置
# set mirror_path  $base_path/mirror

# 配置临时下载索引位置
# set skel_path    $base_path/skel

# 配置日志,URLs和MD5校验信息存储位置
# set var_path     $base_path/var

#  配置删除过期源脚本位置（默认不删除，方便安装旧版本软件）
# set cleanscript $var_path/clean.sh

#  设置默认架构， 可填： amd64 或 i386，默认是和本机一个架构
# set defaultarch  <running host architecture>

# 设定下载后运行的脚本位置
# set postmirror_script $var_path/postmirror.sh

#  设置是否执行 下载后的脚本操作，默认是1(但是默认没有postmirror.sh脚本)
# set run_postmirror 0

# 设置下载线程数
set nthreads     20

# 是否替换URL中的波浪线，替换成%7E（HTML代码），否则会跳过不进行下载
set _tilde 0
#
############# end config ##############

# from sources
deb http://archive.ubuntu.com/ubuntu trusty main restricted universe multiverse
deb http://archive.ubuntu.com/ubuntu trusty-security main restricted universe multiverse
deb http://archive.ubuntu.com/ubuntu trusty-updates main restricted universe multiverse
#deb http://archive.ubuntu.com/ubuntu trusty-proposed main restricted universe multiverse
#deb http://archive.ubuntu.com/ubuntu trusty-backports main restricted universe multiverse

deb-src http://archive.ubuntu.com/ubuntu trusty main restricted universe multiverse
deb-src http://archive.ubuntu.com/ubuntu trusty-security main restricted universe multiverse
deb-src http://archive.ubuntu.com/ubuntu trusty-updates main restricted universe multiverse
#deb-src http://archive.ubuntu.com/ubuntu trusty-proposed main restricted universe multiverse
#deb-src http://archive.ubuntu.com/ubuntu trusty-backports main restricted universe multiverse

clean http://archive.ubuntu.com/ubuntu
```
## download
```
sudo nohup /usr/bin/apt-mirror > /var/spool/apt-mirror/var/cron.log &
```

## publish
> use nginx or apache2

### 1. Apache2 publish
#### install apache2
```
sudo apt-get install apache2
# redirect the apache2 default directory to sources directory
sudo ln -s /var/spool/apt-mirror/mirror/mirrors.aliyun.com/ubuntu /var/www/html/ubuntu
```

### 2. Nginx publish
#### nginx install, if need
```
sudo apt-get remove nginx
sudo apt-get install software-properties-common
sudo add-apt-repository ppa:nginx/stable
sudo apt-get update
sudo apt-get install nginx=1.10.1
# sudo apt-get install nginx
```
#### configure
location `/etc/nginx/sites-enabled/default`
```
server {
 listen port;
 server_name localhost;

 # show directory
 autoindex on;

 location / {
   index index.html index.htm;
   # mirror location
   root /var/spool/apt-mirror/mirror(/mirrors.aliyun.com);
 }

 # location /sources {
 #   index index.html index.htm;
 #   mirror location
 #   root /var/spool/apt-mirror/mirror;
 # }

 access_log /var/log/nginx/localhost.log;
}
```

Then test the configure is ok and restart
```
sudo nginx -t
sudo service nginx restart
```

### modify the apt sources

Visit with `http://[host]:[port]/ubuntu`.

After find the dist/ and pool/ in it, you can add it to /etc/apt/sources.list.

#### add your own sources

```
# Local Source
deb http://[host]:[port]/ubuntu/ trusty main restricted universe multiverse
deb http://[host]:[port]/ubuntu/ trusty-security main restricted universe multiverse
deb http://[host]:[port]/ubuntu/ trusty-updates main restricted universe multiverse
deb http://[host]:[port]/ubuntu/ trusty-proposed main restricted universe multiverse
deb http://[host]:[port]/ubuntu/ trusty-backports main restricted universe multiverse
```
Run `sudo apt-get update`, then you can download fast.

### crontab-update the mirrors
#### config cron for mirrors
```
# you can ref the file /etc/cron.d/apt-mirro
# cat /etc/cron.d/apt-mirror

sudo crontab -e
# add the following line
# {minute} {hour} {day-of-month} {month} {day-of-week} {full-path-to-shell-script}
# 0 4  * * *  apt-mirror  /usr/bin/apt-mirror > /var/spool/apt-mirror/var/cron.log
```
