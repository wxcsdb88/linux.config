# [Linux config Documentation] (http://linuxconfig.readthedocs.io)

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
>[vim plugin](https://github.com/ma6174/vim)
```
sudo wget -qO- https://raw.github.com/ma6174/vim/master/setup.sh | sh -x
```
>sources.list
```
cd linux.config
sudo cp sources.list /etc/apt/
sudo apt-get update
```
>add pypi source
```
sudo mkdir ~/.pip 
sudo touch ~/.pip/pip.conf
```

>and append the follow lines to it
```
[global]
index-url = http://pypi.douban.com/simple
index-url = http://mirrors.aliyun.com/pypi/simple
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


