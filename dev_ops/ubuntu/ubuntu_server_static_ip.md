## ubuntu static ip configure

If ubuntu desktop, you should exec the following first.
```
sudo vi /etc/NetworkManager/NetworkManager.conf
```
And make managed `true`.

### configure modify
```
sudo vi /etc/network/interfaces
```
#### default content
```
# This file describes the network interfaces available on your system
# and how to activate them. For more information, see interfaces(5).
# The loopback network interface
auto lo
iface lo inet loopback
# The primary network interface
auto eth0
iface eth0 inet dhcp
# This is an autoconfigured IPv6 interface
iface eth0 inet6 auto
```
#### example for static configure
```
auto lo
iface lo inet loopback
auto eth0
iface eth0 inet static
address 192.168.1.3
netmask 255.255.255.0
gateway 192.168.1.2
broadcast 192.168.1.255
dns-nameservers 192.168.1.2
```
### dns configure
```
# forever
sudo vi /etc/resolvconf/resolv.conf.d/base
nameserver 192.168.1.2
nameserver 114.114.114.114
```

### enable above configure
```
sudo /etc/init.d/networking restart
```
or
```
sudo ifdown eth0 && sudo ifup eth0
```
