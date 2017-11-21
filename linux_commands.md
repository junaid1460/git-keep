# Linux commands cheatsheet
---
## Process related
 - ps (-axu all)
 - top 
 - htop (task mngr)
 ---
## Network
 - netstat (see ports)
 - curl (get, post)
 - wget

---
## filesystem
 - find (delete exceptional)
 - du ( checking dir size)
 - df (checking partition size)
 - lsof (open file, ports,)
---
## tiling
 - tmux (mine ctrl + a )
---
## `linux` system 
 - password /etc/shadow (password enc)
 - users /etc/passwd
 - sudoers /etc/sudoers
---
## grub 
 - /boot/grub/grub.cfg `grub config`
---
## grub boot fix
```bash
set path /path/to/partition
insmod normal
normal
```
---

## run on boot as sudo

 - /etc/rc.local

## reduce complexity
 - alias

# services 
 - systemctl
 - service
