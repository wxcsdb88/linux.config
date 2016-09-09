# linux.config
1. git
#git install
sudo apt-get install git

#git config
git config --global user.email email
git config --global user.name nickname
git config -l

#Generating public/private rsa key pair.
ssh-keygen -t rsa -b 4096 -C "youremail@xx.xx"

2. set ternimal rel
git clone https://github.com/wxcsdb88/linux.config.git

cd linux.config
cp .inputrc ~/.inputrc
#Don`t use the cp .inputrc /etc/inputrc

3.vim plugin & sources update
sudo cp sources.list /etc/apt/
sudo apt-get update

sudo wget -qO- https://raw.github.com/ma6174/vim/master/setup.sh | sh -x

4.terminator (multi terminator window tools)
sudo apt-get install terminator

5.sougou
wget http://pinyin.sogou.com/linux/download.php?f=linux&bit=64

mv download.php?f=linux sougou.deb
sudo apt-get purge fcitx*
sudo apt-get install gdebi
sudo apt-get install gdebi-core
#solve the depency & install 
gdebi sougou.deb
#reboot to install
reboot







`
