# [Linux config Documentation](http://linuxconfig.readthedocs.io)

### 1. git
>git install
```
sudo apt-get install git
```
>git config
```
git config --global user.email email
git config --global user.name nickname
git config -l
```
>Generating public/private rsa key pair
```
ssh-keygen -t rsa -b 4096 -C "youremail@xx.xx"
```

### 2. terminal config
>[linux.config](https://github.com/wxcsdb88/linux.config)
```
cd linux.config
cp .inputrc ~/.inputrc
```
>shouldn`t use the cp .inputrc /etc/inputrc


### 3. vim plugin & sources
>[vim plugin ma6174](https://github.com/ma6174/vim)
```
sudo wget -qO- https://raw.github.com/ma6174/vim/master/setup.sh | sh -x

```
>[vim plugin spf13 ](https://github.com/spf13/spf13-vim)
```
curl https://j.mp/spf13-vim3 -L > spf13-vim.sh && sh spf13-vim.sh
```
#### sources can ref [apt-sources](https://github.com/wxcsdb88/linux.config/blob/master/sources/apt-sources)
>sources.list
```
cd linux.config
sudo cp sources.list /etc/apt/
sudo apt-get update
```
#### sources can ref [pip-sources](https://github.com/wxcsdb88/linux.config/blob/master/sources/pypi-sources)

>and add ~/.pip/pip.conf that includes:
```
[global]
trusted-host =  pypi.doubanio.com
index-url = https://pypi.doubanio.com/simple
# trusted-host =  pypi.python.org
# index-url = https://pypi.python.org/pypi/simple
# trusted-host =  mirrors.aliyun.com
# index-url = https://mirrors.aliyun.com/pypi/simple
```

### 4. terminator(multiple windows)
```
sudo apt-get install terminator
```

### 5. go
>[go1.7 for linux](https://golang.org/doc/install?download=go1.7.1.linux-amd64.tar.gz)

>[go doc](https://golang.org/doc/)
```
sudo tar -C /usr/local -xzf go1.7.1.linux-amd64.tar.gz
```
>add following lines to /etc/profile
```
export GOROOT=/usr/local/go
export GOBIN=$GOROOT/bin
export PATH=$GOROOT/bin:$PATH
export GOPATH=$HOME/dev/work
```
>show go enviroment
```
go env
```
>[go1.7 for win x64](https://golang.org/dl/)
```
install location #  D:\Go
```
>win10  win+x->path config:
```
config path:
GOROOT=D:\Go
GOPATH=E:\workspace\go
GOBIN=%GOROOT%\bin
PATH=%GOROOT%;%PATH%
```
>hello.go

```go
package main

import "fmt"

func main(){
        fmt.Printf("hello, world\n")

}

```
>build and run
```
go build hello.go
#linux
./hello
#or windows
hello.exe
#
go run hello.go
```
