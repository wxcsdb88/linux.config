## ubuntu cluster user batch add, delete

username=`username`

### 1. ssh connect

### 2. adduser
sudo adduser `${username}` -p `${username}_pwd`

### 3. configure
- sudoers

```
  sudo sed -i /^${username}.*ALL=/d /etc/sudoers
  sudo sed -i /^root.*ALL=/a\\"${username}    ALL=(ALL:ALL) ALL" /etc/sudoers
```

- ssh

```
# forbidden root login
sudo sed -i s/"PermitRootLogin without-password"/"PermitRootLogin no"/\
 /etc/ssh/sshd_config

# forbidden empty passwords
sudo sed -i s/"PermitEmptyPasswords yes"/"PermitEmptyPasswords no"/\
 /etc/ssh/sshd_config

# enable password authentication
sudo sed -i s/"#PasswordAuthentication yes"/"PasswordAuthentication yes"/\
 /etc/ssh/sshd_config

```

- pip.conf

```
sudo mv ~/.pip /home/${username}/
sudo chown -R ${username}:${username} /home/${username}/.pip
```

### 4. del old user
```
sudo userdel -rf `whoami`
```
