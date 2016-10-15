# base

## git
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

## terminal config
>[linux.config](https://github.com/wxcsdb88/linux.config)
```
cd linux.config
cp .inputrc ~/.inputrc
```
>shouldn`t use the cp .inputrc /etc/inputrc

## vim plugin & sources
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
>add pypi source for China
```
sudo mkdir ~/.pip 
sudo touch ~/.pip/pip.conf
```
>and append the follow lines to pip.conf
```
[global]
index-url = http://pypi.douban.com/simple
index-url = http://mirrors.aliyun.com/pypi/simple
```

## terminator(multiple windows)
```
sudo apt-get install terminator
```
