## VM Workstation net configure for ubuntu14 server
use WIN10
### 1. configure VMnet8
VMnet8 VMware Network Adapter
- 共享主机ip给VMnet8
- 配置VMnet8 ip及子网掩码
examples:
```
ip:      192.168.1.1
netmask: 255.255.255.0
```

### 2. VM 网络配置
- 虚拟网络编辑器

  分配网络地址，192.168.1.0 子网掩码 255.255.255.0
- NAT 设置

  设置网关地址，与VM8在同一网段内，未使用的地址，如：192.168.1.2

- DHCP 配置

  起始地址：192.168.1.3
  结束地址：192.168.1.254
  修改租用时间，延长到合适时间即可
- 绑定网卡VMnet8 到虚拟机

  选择虚拟机设置，选择网络适配器，选择特定网络至VMnet8(NAT模式)
  
### 3. 虚拟机IP设置
首先，启动虚拟机
然后，设置虚拟机IP固定，如下操作：

`sudo vi /etc/network/interfaces`

添加或修改网卡配置
```
auto lo
iface lo inet loopback

# The primary network interface
auto eth0
iface eth0 inet static # 修改为静态IP
address 192.168.1.3 # 与网关在同一网段，且并未占用
gateway 192.168.1.2 # 需要与VM设置的网关保持一致
netmask 255.255.255.0
dns-nameservers 192.168.1.2 # 不设置无法访问外网,与网关一致即可
```
